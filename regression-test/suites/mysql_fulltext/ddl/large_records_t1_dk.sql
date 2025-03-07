CREATE TABLE IF NOT EXISTS large_records_t1_dk (
    FTS_DOC_ID BIGINT NOT NULL,
	a TEXT,
    b TEXT,
    INDEX a_idx (a) USING INVERTED PROPERTIES("parser"="standard", "ignore_above"="2000") COMMENT 'a_idx',
    INDEX b_idx (b) USING INVERTED PROPERTIES("parser"="standard", "ignore_above"="2000") COMMENT 'b_idx'
)
DUPLICATE KEY(FTS_DOC_ID)
DISTRIBUTED BY HASH(FTS_DOC_ID) BUCKETS 3
PROPERTIES ( 
    "replication_num" = "1" 
);