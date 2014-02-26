select
	
	allergies.value('*:effectiveTime[1]/*:low[1]/@value', 'varchar(50)') as ALLERGY_START_DATE
	,allergies.value('*:effectiveTime[1]/*:high[1]/@value', 'varchar(50)') as ALLERGY_END_DATE	
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.28"]/*:value)[1]/@code', 'varchar(20)') as ALLERGY_STATUS_CODE
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.28"]/*:value)[1]/@displayName', 'varchar(50)') as ALLERGY_STATUS_DISPLAY_NAME
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.28"]/*:value)[1]/@codeSystem', 'varchar(30)') as ALLERGY_STATUS_CODE_SYSTEM
	
	,allergies.value('*:value[1]/@code', 'varchar(20)') as ALLERGY_TYPE_CODE
	,allergies.value('*:value[1]/@codeSystem', 'varchar(30)') as ALLERGY_TYPE_CODE_SYSTEM
	,allergies.value('*:value[1]/@displayName', 'varchar(50)') as ALLERGY_TYPE_DISPLAY_NAME
		
	,allergies.value('(*:participant[@typeCode="CSM"]/*:participantRole[@classCode="MANU"]/*:playingEntity[@classCode="MMAT"]/*:code)[1]/@code', 'varchar(20)') as ALLERGY_AGENT_CODE
	,allergies.value('(*:participant[@typeCode="CSM"]/*:participantRole[@classCode="MANU"]/*:playingEntity[@classCode="MMAT"]/*:code)[1]/@codeSystem', 'varchar(30)') as ALLERGY_AGENT_CODE_SYSTEM
	,allergies.value('(*:participant[@typeCode="CSM"]/*:participantRole[@classCode="MANU"]/*:playingEntity[@classCode="MMAT"]/*:code)[1]/@displayName', 'varchar(50)') as ALLERGY_AGENT_DISPLAY_NAME
	
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.8"]/*:value)[1]/@code', 'varchar(20)') as ALLERGY_SEVERITY_CODE
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.8"]/*:value)[1]/@displayName', 'varchar(30)') as ALLERGY_SEVERITY_DISPLAY_NAME
	,allergies.value('(*:entryRelationship/*:observation[*:templateId/@root="2.16.840.1.113883.10.20.22.4.8"]/*:value)[1]/@codeSystem', 'varchar(30)') as ALLERGY_SEVERITY_CODE_SYSTEM
	
from 
      CCD CROSS APPLY
      document.nodes('//*:observation[./*:templateId/@root="2.16.840.1.113883.10.20.22.4.7"]') AS doc(allergies)