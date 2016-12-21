﻿CREATE XML SCHEMA COLLECTION [dbo].[schema_presidentes] AS 
N'
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="Presidentes">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" name="Presidente">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="nome" type="xs:string"/>
              <xs:element name="image" type="xs:string" />
              <xs:element name="inicio" type="xs:unsignedShort" />
              <xs:element minOccurs="0" name="fim" type="xs:unsignedShort" />
              <xs:element name="nascimento" type="xs:string" />
              <xs:element minOccurs="0" name="morte" type="xs:string" />
              <xs:element name="partidos">
                <xs:complexType>
                  <xs:sequence>
                    <xs:element maxOccurs="unbounded" name="partido" type="xs:string" />
                  </xs:sequence>
                </xs:complexType>
              </xs:element>
              <xs:element minOccurs="0" name="esposa" type="xs:string" />
            </xs:sequence>
            <xs:attribute name="ID" type="xs:unsignedByte" use="required" />
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>

'
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PresidentSet'
CREATE TABLE [dbo].[PresidentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
	[xml_presidentes] [xml](Document [dbo].[schema_presidentes])
);
GO