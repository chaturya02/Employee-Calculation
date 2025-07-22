SELECT 
    t1.EmpID,
    t1.Name,
    CONVERT(VARCHAR, DATEADD(SECOND, SUM(DATEDIFF(SECOND, t1.CheckInCheckOutTime, t2.CheckInCheckOutTime)), 0), 108) AS TotalWorkHours
FROM InputTable t1
JOIN InputTable t2 
  ON t1.EmpID = t2.EmpID
  AND t1.Attendance = 'IN'
  AND t2.Attendance = 'OUT'
  AND t2.CheckInCheckOutTime > t1.CheckInCheckOutTime
  AND NOT EXISTS (
      SELECT 1 FROM InputTable t3
      WHERE t3.EmpID = t1.EmpID
        AND t3.CheckInCheckOutTime > t1.CheckInCheckOutTime
        AND t3.CheckInCheckOutTime < t2.CheckInCheckOutTime
        AND t3.Attendance IN ('IN', 'OUT')
  )
GROUP BY t1.EmpID, t1.Name;
