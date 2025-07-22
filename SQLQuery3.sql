SELECT 
    EmpID,
    Name,
    MIN(CASE WHEN Attendance = 'IN' THEN CheckInCheckOutTime END) AS FirstCheckInTime,
    MAX(CASE WHEN Attendance = 'OUT' THEN CheckInCheckOutTime END) AS LastCheckOutTime,
    COUNT(CASE WHEN Attendance = 'OUT' THEN 1 END) AS TotalOutCount
FROM InputTable
GROUP BY EmpID, Name;
