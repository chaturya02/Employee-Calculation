# Employee Check IN and Check OUT Calculation
A SQL-based employee attendance tracking system that manages check-in/check-out times and calculates work hours for employees.

## Database Schema

The system uses a single table `InputTable` to store employee attendance records:

```sql
CREATE TABLE InputTable (
    EmpID INT,
    Name VARCHAR(50),
    CheckInCheckOutTime DATETIME,
    Attendance VARCHAR(5)
);
```

## Files Overview

### [SQLQuery1.sql](SQLQuery1.sql)
**Database Setup**
- Drops existing `InputTable` if it exists
- Creates the main `InputTable` with the required schema

### [SQLQuery2.sql](SQLQuery2.sql)
**Sample Data Insertion**
- Inserts sample attendance data for 3 employees (Him, Raj, Anu)
- Contains multiple check-in/check-out records for a single day (2024-01-03)
- Demonstrates various attendance patterns including multiple sessions

### [SQLQuery3.sql](SQLQuery3.sql)
**Daily Summary Report**
- Retrieves employee attendance summary including:
  - First check-in time of the day
  - Last check-out time of the day
  - Total number of check-outs (sessions worked)

### [SQLQuery4.sql](SQLQuery4.sql)
**Total Work Hours Calculation**
- Calculates total work hours for each employee
- Matches IN/OUT pairs chronologically
- Handles multiple work sessions per day
- Returns formatted work hours in HH:MM:SS format

## Usage Instructions

1. **Setup Database**: Run [SQLQuery1.sql](SQLQuery1.sql) to create the table structure
2. **Insert Data**: Run [SQLQuery2.sql](SQLQuery2.sql) to populate with sample data
3. **Generate Reports**: 
   - Run [SQLQuery3.sql](SQLQuery3.sql) for daily attendance summary
   - Run [SQLQuery4.sql](SQLQuery4.sql) for total work hours calculation

## Sample Data

The system includes sample data for three employees:
- **Him** (EmpID: 1) - 3 work sessions
- **Raj** (EmpID: 2) - 2 work sessions  
- **Anu** (EmpID: 3) - 2 work sessions

## Query Features

- **Chronological Matching**: Properly pairs IN/OUT records in time sequence
- **Multiple Sessions**: Handles employees with multiple work sessions per day
- **Time Calculations**: Accurate work hour calculations using DATEDIFF and DATEADD
- **Data Integrity**: Ensures no overlapping time calculations with EXISTS clause

## Database Compatibility

- Designed for Microsoft SQL Server
- Uses SQL Server specific functions (CONVERT, DATEADD, DATEDIFF)
- Compatible with SQL Server 2012 and later versions

## Contributing

Feel free to submit issues and enhancement requests!
