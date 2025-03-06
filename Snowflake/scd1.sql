-- Create Stored Procedure for scd 2

CREATE OR REPLACE PROCEDURE pdr_scd_demo()
RETURNS STRING NOT NULL
LANGUAGE SQL
AS
$$
BEGIN
    -- Perform the merge operation
    MERGE INTO customer c
    USING customer_raw cr
    ON c.customer_id = cr.customer_id
    WHEN MATCHED AND (
            c.first_name  <> cr.first_name  
            OR c.last_name   <> cr.last_name   
            OR c.email       <> cr.email       
            OR c.street      <> cr.street      
            OR c.city        <> cr.city        
            OR c.state       <> cr.state       
            OR c.country     <> cr.country
        )
    THEN 
    UPDATE SET 
        c.first_name  = cr.first_name, 
        c.last_name   = cr.last_name,  
        c.email       = cr.email,      
        c.street      = cr.street,     
        c.city        = cr.city,       
        c.state       = cr.state,      
        c.country     = cr.country,
        c.update_timestamp = CURRENT_TIMESTAMP()
    WHEN NOT MATCHED 
    THEN INSERT (
        customer_id, first_name, last_name, email, street, city, state, country
    )
    VALUES (
        cr.customer_id, cr.first_name, cr.last_name, cr.email, cr.street, cr.city, cr.state, cr.country
    );

    -- Truncate the staging table after the merge
    TRUNCATE TABLE SCD_DEMO.SCD2.customer_raw;

    -- Return success message
    RETURN 'Merge and truncate operations completed successfully.';
END;
$$;

call pdr_scd_demo();


-- Automate by creating a task

create or replace task tsk_scd_raw warehouse = COMPUTE_WH schedule = '1 minute'
ERROR_ON_NONDETERMINISTIC_MERGE=FALSE
as
call pdr_scd_demo();

show tasks;

alter task tsk_scd_raw resume; --suspend