{
	"contents": {
		"09928231-1caa-41a5-95ba-9a45d5acca4a": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "ats.emp.employeeonboarding",
			"subject": "EmployeeOnboarding",
			"name": "EmployeeOnboarding",
			"documentation": "Employee onboarding",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"fd3226a5-d5ff-44e4-a01c-ad3773d10a58": {
					"name": "EmployeeData"
				},
				"8454a72e-36cb-46e2-9949-90c5d4e07c62": {
					"name": "PostEmployeeS4"
				},
				"ee33442f-f883-4de0-9fe9-842df8e1b1ee": {
					"name": "DetermineCardType"
				},
				"38813b75-15e4-491c-b81b-a82f1359ac65": {
					"name": "MapEmpBandToRule"
				},
				"2f44abe1-4846-417f-99cf-081a633cc646": {
					"name": "SendEmailCard"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"60114c10-f024-4f0b-b599-cbf432b26b07": {
					"name": "SequenceFlow2"
				},
				"1eeed4f5-894d-4bde-b74a-398a545b6313": {
					"name": "SequenceFlow3"
				},
				"4a78ac31-f767-4116-a14c-49cbad34f0b4": {
					"name": "SequenceFlow4"
				},
				"85fa09b1-1a9f-4533-b5ee-b0d12d0c96f5": {
					"name": "SequenceFlow5"
				},
				"d0c3e51b-a32b-40d5-86c6-91df32c98901": {
					"name": "SequenceFlow6"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"c0dfb5a8-b8d2-4821-aa27-2a5680458bd8": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"fd3226a5-d5ff-44e4-a01c-ad3773d10a58": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "EmployeeData",
			"description": "On-boarding",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/EmployeeOnboarding/EmployeeOnboard.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "employeeonboard"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "EmployeeData"
		},
		"8454a72e-36cb-46e2-9949-90c5d4e07c62": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANA",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/EmpWorkflowSet",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/$metadata",
			"requestVariable": "${context.employeeData}",
			"responseVariable": "${context.resultEmployee}",
			"id": "servicetask1",
			"name": "PostEmployeeS4",
			"documentation": "send employee data to S/4 HANA"
		},
		"ee33442f-f883-4de0-9fe9-842df8e1b1ee": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"destinationSource": "consumer",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.bussinessRule}",
			"responseVariable": "${context.resulBusinessRule}",
			"id": "servicetask2",
			"name": "DetermineCardType",
			"documentation": "Find Cart type depends on employee band"
		},
		"38813b75-15e4-491c-b81b-a82f1359ac65": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/EmployeeOnboarding/mapping.js",
			"id": "scripttask1",
			"name": "MapEmpBandToRule"
		},
		"2f44abe1-4846-417f-99cf-081a633cc646": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "SendEmailCard",
			"mailDefinitionRef": "7b5d572b-0c67-4919-9f66-4335dfc5243b"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "fd3226a5-d5ff-44e4-a01c-ad3773d10a58"
		},
		"60114c10-f024-4f0b-b599-cbf432b26b07": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "fd3226a5-d5ff-44e4-a01c-ad3773d10a58",
			"targetRef": "8454a72e-36cb-46e2-9949-90c5d4e07c62"
		},
		"1eeed4f5-894d-4bde-b74a-398a545b6313": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "8454a72e-36cb-46e2-9949-90c5d4e07c62",
			"targetRef": "38813b75-15e4-491c-b81b-a82f1359ac65"
		},
		"4a78ac31-f767-4116-a14c-49cbad34f0b4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "ee33442f-f883-4de0-9fe9-842df8e1b1ee",
			"targetRef": "2f44abe1-4846-417f-99cf-081a633cc646"
		},
		"85fa09b1-1a9f-4533-b5ee-b0d12d0c96f5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "38813b75-15e4-491c-b81b-a82f1359ac65",
			"targetRef": "ee33442f-f883-4de0-9fe9-842df8e1b1ee"
		},
		"d0c3e51b-a32b-40d5-86c6-91df32c98901": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "2f44abe1-4846-417f-99cf-081a633cc646",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"fb9bd099-3e8f-4021-8f22-556dc5f4c94f": {},
				"f997828f-d065-4424-bad3-d6837512dad6": {},
				"e933c8f0-9244-449b-a1b4-20d523ef4244": {},
				"69e6203f-8bd4-4d7e-b80a-1999e80a1329": {},
				"078de299-44d6-43d4-8e7f-df6eeec95326": {},
				"ae1d763f-2bb8-4170-a345-006582cedebd": {},
				"1c0c27c2-d768-4690-a2fb-9ccf2f360dab": {},
				"f5fc4a22-0aed-41b3-8ce9-c461a536e156": {},
				"effa3f88-e8db-4dd5-8615-cc696ad591c7": {},
				"9d86df86-8985-457a-b33d-202985dbda93": {}
			}
		},
		"c0dfb5a8-b8d2-4821-aa27-2a5680458bd8": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/EmployeeOnboarding/employeeBoarding.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 46,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 44.5,
			"y": 644,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,44 62,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "fb9bd099-3e8f-4021-8f22-556dc5f4c94f",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"fb9bd099-3e8f-4021-8f22-556dc5f4c94f": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 12,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "fd3226a5-d5ff-44e4-a01c-ad3773d10a58"
		},
		"f997828f-d065-4424-bad3-d6837512dad6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,154 62,204",
			"sourceSymbol": "fb9bd099-3e8f-4021-8f22-556dc5f4c94f",
			"targetSymbol": "e933c8f0-9244-449b-a1b4-20d523ef4244",
			"object": "60114c10-f024-4f0b-b599-cbf432b26b07"
		},
		"e933c8f0-9244-449b-a1b4-20d523ef4244": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "8454a72e-36cb-46e2-9949-90c5d4e07c62"
		},
		"69e6203f-8bd4-4d7e-b80a-1999e80a1329": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,264 62,314",
			"sourceSymbol": "e933c8f0-9244-449b-a1b4-20d523ef4244",
			"targetSymbol": "1c0c27c2-d768-4690-a2fb-9ccf2f360dab",
			"object": "1eeed4f5-894d-4bde-b74a-398a545b6313"
		},
		"078de299-44d6-43d4-8e7f-df6eeec95326": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 424,
			"width": 100,
			"height": 60,
			"object": "ee33442f-f883-4de0-9fe9-842df8e1b1ee"
		},
		"ae1d763f-2bb8-4170-a345-006582cedebd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,484 62,534",
			"sourceSymbol": "078de299-44d6-43d4-8e7f-df6eeec95326",
			"targetSymbol": "effa3f88-e8db-4dd5-8615-cc696ad591c7",
			"object": "4a78ac31-f767-4116-a14c-49cbad34f0b4"
		},
		"1c0c27c2-d768-4690-a2fb-9ccf2f360dab": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 12,
			"y": 314,
			"width": 100,
			"height": 60,
			"object": "38813b75-15e4-491c-b81b-a82f1359ac65"
		},
		"f5fc4a22-0aed-41b3-8ce9-c461a536e156": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,374 62,424",
			"sourceSymbol": "1c0c27c2-d768-4690-a2fb-9ccf2f360dab",
			"targetSymbol": "078de299-44d6-43d4-8e7f-df6eeec95326",
			"object": "85fa09b1-1a9f-4533-b5ee-b0d12d0c96f5"
		},
		"effa3f88-e8db-4dd5-8615-cc696ad591c7": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 12,
			"y": 534,
			"width": 100,
			"height": 60,
			"object": "2f44abe1-4846-417f-99cf-081a633cc646"
		},
		"9d86df86-8985-457a-b33d-202985dbda93": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,594 62,644",
			"sourceSymbol": "effa3f88-e8db-4dd5-8615-cc696ad591c7",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "d0c3e51b-a32b-40d5-86c6-91df32c98901"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 1,
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 2,
			"scripttask": 1,
			"mailtask": 1
		},
		"7b5d572b-0c67-4919-9f66-4335dfc5243b": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "kajajayasree28@gmail.com",
			"subject": "Employee${context.employeeDta.Empname} was onboarded",
			"text": "Dear ${context.employeeData.Empname},\nCongratulations for your new Job!\n\nA New Credit card of category ${contxt.resultBusinessRule.Result[0].cardType} was issued to you.\n\nRegards,\nSAP BTP Workflow,\nJaya Sree.",
			"ignoreInvalidRecipients": true,
			"id": "maildefinition1"
		}
	}
}