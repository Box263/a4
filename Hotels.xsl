<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head><title>Hotels</title></head>
      <body>
        <h1>Hotels</h1>
        <table border="1">
          <tr><th>ID</th><th>Name</th><th>Rating</th><th>Phones</th><th>Address</th><th>NearestAirport</th></tr>
          <xsl:for-each select="/*[local-name()='Hotels']/*[local-name()='Hotel']">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="*[local-name()='Name']"/></td>
              <td><xsl:value-of select="@Rating"/></td>
              <td>
                <xsl:for-each select="*[local-name()='Phone']">
                  <xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
                </xsl:for-each>
              </td>
              <td>
                <xsl:value-of select="*[local-name()='Address']/*[local-name()='Number']"/> 
                <xsl:value-of select="*[local-name()='Address']/*[local-name()='Street']"/>, 
                <xsl:value-of select="*[local-name()='Address']/*[local-name()='City']"/>, 
                <xsl:value-of select="*[local-name()='Address']/*[local-name()='State']"/> 
                <xsl:value-of select="*[local-name()='Address']/*[local-name()='Zip']"/>
              </td>
              <td><xsl:value-of select="*[local-name()='Address']/@NearstAirport"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
