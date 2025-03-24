%dw 2.0
import * from dw::util::Timer
output application/java
---
{
	"Errors": [],
	"Delimiters": "*>U~",
	"TransactionSets": {
		"v004010VICS": {
			"855": [{
				"Interchange": {
					"ISA09":payload.DATE as Date  {format: "yyyy-MM-dd"} as Date {format:"yyMMdd"} ,
					"ISA04": "",
					"ISA15": "P",
					"ISA03": "00",
					"ISA14": "0",
					"ISA02": "",
					"ISA13": payload.INTERCHANGE_CONTROL_NUMBER,
					"ISA01": ("00" default "") ,
					"ISA12": "00401",
					"ISA08": payload.RECEIVER_ID,
					"ISA07": "ZZ",
					"ISA06": payload.SENDERID,
					"ISA05": "ZZ",
					"ISA16": ">",
					"ISA11": "U",
					"ISA10": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
						unit: "milliseconds"
					}  as Number
				},
				"Group": {
					"GS05": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
						unit: "milliseconds"
					}  as Number,
					"GS04": payload.DATE as Date  {format: "yyyy-MM-dd"} as Date {format:"yyMMdd"},
					"GS07": "X",
					"GS06": payload.GROUP_CONTROL_NUMBER as Number as Number,
					"GS08": "004010VICS",
					"GS01": "PR",
					"GS03": payload.RECEIVER_ID,
					"GS02": payload.SENDERID
				},
				"Heading": {
					"020_BAK": {
						"BAK04": now() as Date {
							format: "yyMMdd"
						},
						"BAK08": "1032883179",
						"BAK01": "00",
						"BAK02": "AT",
						"BAK03": payload.PURCHASEORDERNUMBER
					}
				},
				"SetTrailer": {
					"SE02": payload.GROUP_CONTROL_NUMBER as Number as Number,
					"SE01": 3
				},
				"Summary": {
				},
				"Id": "855",
				"SetHeader": {
					"ST01": "855",
					"ST02": payload.GROUP_CONTROL_NUMBER as Number as Number
				},
				"Detail": {
				},
				"Name": "Purchase Order Acknowledgment"
			}]
		}
	},
	"FunctionalAcksGenerated": [{
		"Interchange": {
			"ISA09": now() as  Date {
				format: "yyMMdd"
			},
			"ISA04": "",
			"ISA15": "P",
			"ISA03": "00",
			"ISA14": "0",
			"ISA02": "",
			"ISA13": payload.INTERCHANGE_CONTROL_NUMBER,
			"ISA01": "00",
			"ISA12": "00401",
			"ISA08": payload.SENDERID,
			"ISA07": "ZZ",
			"ISA06": payload.RECEIVER_ID,
			"ISA05": "ZZ",
			"ISA16": ">",
			"ISA11": "U",
			"ISA10": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
				unit: "milliseconds"
			}  as Number
		},
		"Group": {
			"GS05": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
				unit: "milliseconds"
			}  as Number,
			"GS04": now() as Date {
				format: "yyMMdd"
			},
			"GS07": "X",
			"GS06": payload.GROUP_CONTROL_NUMBER as Number as Number,
			"GS08": "004010VICS",
			"GS01": "PR",
			"GS03": payload.SENDERID,
			"GS02": payload.RECEIVER_ID
		},
		"Heading": {
			"0200_AK1": {
				"AK101": "PR",
				"AK102": payload.GROUP_CONTROL_NUMBER as Number as Number
			},
			"0700_AK9": {
				"AK903": 1,
				"AK904": 1,
				"AK901": "A",
				"AK902": 1
			}
		},
		"Id": "997",
		"Name": "Functional Acknowledgment"
	}],
	"InterchangeAcksGenerated": [{
		"Interchange": {
			"ISA09": now() as Date {
				format: "yyMMdd"
			},
			"ISA04": "",
			"ISA15": "P",
			"ISA03": "00",
			"ISA14": "0",
			"ISA02": "",
			"ISA13": payload.INTERCHANGE_CONTROL_NUMBER,
			"ISA01": "00",
			"ISA12": "00401",
			"ISA08": payload.SENDERID,
			"ISA07": "ZZ",
			"ISA06": payload.RECEIVER_ID,
			"ISA05": "ZZ",
			"ISA16": ">",
			"ISA11": "U",
			"ISA10": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
				unit: "milliseconds"
			}  as Number
		},
		"TA104": "A",
		"TA105": "000",
		"TA102": now() as Date {
			format: "yyMMdd"
		},
		"TA103": (payload.DATE ++ "T" ++ payload.TIME) as DateTime {
			unit: "milliseconds"
		}  as Number,
		"TA101": payload.INTERCHANGE_CONTROL_NUMBER
	}]
}