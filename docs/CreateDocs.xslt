<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="output-filename" select="'output.txt'" />

	<xsl:variable name="settings" select="//Settings/Settings" />
	<xsl:variable name="texts" select="//Texts/Text" />
	<xsl:variable name="languages" select="//Languages/Language" />
	<xsl:variable name="levels" select="//Levels/Level" />
	<xsl:variable name="versions" select="//Versions/Version" />
	<xsl:variable name="profiles" select="//Profiles/Profile" />
	<xsl:variable name="gameplays" select="//Gameplays/Gameplay" />
	<xsl:variable name="appitems" select="//AppItems/AppItem" />
	
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
        <p>
            There are <xsl:value-of select="count($levels)" /> Levels defined in this game.
        </p>

		<h2>Levels</h2>
        <br/>
		
        <xsl:for-each select="$levels">
			
            <xsl:sort select="MenuName" />
            <div>
				<h3><xsl:value-of select="LevelName" />
                <xsl:value-of select="MenuName" /></h3>
				<xsl:text>Level Solution</xsl:text>
				
				<pre><xsl:value-of select = "translate(SolutionBinary,'10','x ')" />
					
Level Size: <xsl:value-of select="LevelSize" />	
Total Cells: <xsl:value-of select="TotalCells" />
Group Number: <xsl:value-of select="GroupNumber" />
Level Number: <xsl:value-of select="LevelNumber" />
					
				</pre>
            </div>    
			
			
        </xsl:for-each>
		<br/>
		
        <h2>Languages</h2>
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
		
		
				        <h2>Texts</h2>
        <p>
            These are the many texts shown in this game
        </p>
        <xsl:for-each select="$texts">    
            <xsl:sort select="Token" />
            <div>
                <xsl:value-of select="Token" />
				<br/>
				<xsl:value-of select="Description" />
            </div>    
        </xsl:for-each>
		
		        <h2>Settings</h2>
        <p>
            There are <xsl:value-of select="count($settings)" /> settings defined in this game. 
        </p>
        <xsl:for-each select="$settings">    
            <xsl:sort select="Name" />
            <div>
                <xsl:value-of select="Name" />
				<br/>
				<xsl:value-of select="Description" />
            </div>    
        </xsl:for-each>
		
				        <h2>AppItems</h2>
        <p>
            These are buttons available to interact with in CrossMe
        </p>
        <xsl:for-each select="$appitems">    
            <xsl:sort select="ButtonPurpose" />
            <div>
                <xsl:value-of select="ButtonPurpose" />
				<pre>  (<xsl:value-of select="DisplayName" />)  </pre>
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
