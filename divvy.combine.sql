CREATE TABLE `Divvy.2025tripdata` AS (
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_01`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_02`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_03`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_04`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_05`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_06`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_07`
  UNION ALL 
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_08`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_09`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_10`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_11`
  UNION ALL
  SELECT * FROM `cloudysanfrancisco-446816.Divvy.2024_12`
)