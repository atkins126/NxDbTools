/**********************************************************************************/
/* Code generated with NexusDB Enterprise Manager Data Dictionary Code Generator  */
/* 2021-01-02 08:16:09                                                            */
/*                                                                                */
/* Version: 4.5024                                                                */
/*                                                                                */
/**********************************************************************************/

/* Drop tables -------------------------------------------------------------- */

DROP TABLE IF EXISTS "TransportLUT";
DROP TABLE IF EXISTS "NxSqlButtonsDb";
DROP TABLE IF EXISTS "NxDbSqlToolsPrjs";
DROP TABLE IF EXISTS "BuNxSqlButtonsDb";

/* Create tables ------------------------------------------------------------ */

/* BuNxSqlButtonsDb */
CREATE TABLE "BuNxSqlButtonsDb"
(
  "BtnId" AUTOINC,
  "PanelNum" BYTE NOT NULL,
  "BtnTop" INT NOT NULL,
  "BtnLeft" INT NOT NULL,
  "BtnWidth" INT NOT NULL,
  "Caption" NVARCHAR(25) NOT NULL,
  "ExtraText" NVARCHAR(15),
  "CursorBeforeThisChar" SINGLECHAR,
  "SpaceAfterCursor" BOOLEAN DEFAULT FALSE,
  "UseExtendedSql" BOOLEAN DEFAULT FALSE,
  "SqlCode" CLOB
);

CREATE INDEX "BtnId" ON "BuNxSqlButtonsDb"("BtnId");
CREATE INDEX "PanelNum" ON "BuNxSqlButtonsDb"("PanelNum");

/* NxDbSqlToolsPrjs */
CREATE TABLE "NxDbSqlToolsPrjs"
  STORAGE ENGINE 'Variable'
(
  "PrjName" NVARCHAR(30) NOT NULL,
  "PrjPath" NVARCHAR(255),
  "TransportID" INT DEFAULT 4 DESCRIPTION '0=tcip, 2=pipe, 3=local',
  "Server" NVARCHAR(95),
  "Alias" NVARCHAR(95),
  "PassFileSaveLoc" NVARCHAR(255),
  "DbPassWord" NVARCHAR(255),
  "Memo" CLOB
);

CREATE INDEX "PrjName" ON "NxDbSqlToolsPrjs"("PrjName");

/* NxSqlButtonsDb */
CREATE TABLE "NxSqlButtonsDb"
(
  "BtnId" AUTOINC,
  "PanelNum" BYTE NOT NULL,
  "BtnTop" INT NOT NULL,
  "BtnLeft" INT NOT NULL,
  "BtnWidth" INT NOT NULL,
  "Caption" NVARCHAR(25) NOT NULL,
  "ExtraText" NVARCHAR(15),
  "CursorBeforeThisChar" SINGLECHAR,
  "SpaceAfterCursor" BOOLEAN DEFAULT FALSE,
  "UseExtendedSql" BOOLEAN DEFAULT FALSE,
  "SqlCode" CLOB,
  "Color" BIGINT,
  "Hints" NVARCHAR(255),
  "NexusDbHelpUrl" NVARCHAR(255)
);

CREATE INDEX "BtnId" ON "NxSqlButtonsDb"("BtnId");
CREATE INDEX "PanelNum" ON "NxSqlButtonsDb"("PanelNum");

/* TransportLUT */
CREATE TABLE "TransportLUT"
(
  "TransportID" INT,
  "Name" NVARCHAR(10)
);
