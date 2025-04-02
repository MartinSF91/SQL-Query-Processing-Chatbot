SELECT AL1.L46ADR,
       AL1.LOGGUSER,
       AL1.L47CLDAT,
       AL1.SEQNO,
       AL1.L47CLFNO,
       AL1.L47CLIND,
       AL1.L47CLQST,
       AL1.L47CLANS,
       AL1.L47CLCMT,
       AL1.L47CLISA,
       AL1.L47CLATT,
       AL1.L47CLPHY,
       AL1.MAROWVER,
       AL1.L47CLDAT AS L47CLDATDUPLI,
       AL2.FNAME,
       AL2.LNAME, --AL3.MA_DESC,
 AL3.L47DESC,
 AL2.PHSITE,
 AL2.ADDRESS1
FROM AST019.L47T31 AL1,
     AST019.S90T1 AL2,
     AST019.L47T1 AL3
WHERE (AL3.L46ADR (+) = AL1.L46ADR
       AND AL1.LOGGUSER =AL2.UNAME)
  AND (TRUNC(AL1.L47CLDAT) = TRUNC(sysdate))
  AND to_char(L47CLDAT, 'HH24') >= '04:00:00'
  AND to_char(L47CLDAT, 'HH24') <= '15:00:00'