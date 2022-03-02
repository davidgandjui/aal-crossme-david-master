<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="output-filename" select="'output.txt'" />

	<xsl:variable name="languages" select="//Languages/Language" />
	<xsl:variable name="levels" select="//Levels/Level" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>daviddocs.html</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"><html>
    <head>
        <title>David's Cross-Me Game Specification</title>
    </head>
    <body>
        <h1>David's Cross-Me Specification</h1>
        <p>
            This is the specification for David's version of Cross-me.
        </p>

        <h3>Levels</h3>
        <p>
            There are <xsl:value-of select="count($levels)" /> Levels defined in this game. 
        </p>
        <xsl:for-each select="$levels">    
            <xsl:sort select="MenuName" />
            <div>
				<xsl:value-of select="MenuName" />
                <xsl:value-of select="LevelName" />
				<br/>
				<xsl:value-of select="Description" />
				
            </div>    
        </xsl:for-each>
		
		
        <h3>Languages</h3>
        <p>
            There are <xsl:value-of select="count($languages)" /> languages defined in this game. 
        </p>
        <xsl:for-each select="$languages">    
            <xsl:sort select="Name" />
            <div>
                <xsl:value-of select="Name" />
				<br/>
				<xsl:value-of select="Description" />
				
            </div>    
        </xsl:for-each>
    </body>
                    </html>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
