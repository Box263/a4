<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT stylesheet to transform Hotels.xml into an HTML table -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:h="https://box263.github.io/a4"
  exclude-result-prefixes="h">

  <!-- Output the result as HTML -->
  <xsl:output method="html" encoding="UTF-8"/>

  <!-- Template matching the root element -->
  <xsl:template match="/">
    <html>
      <head><title>Hotels</title></head>
      <body>
        <h1>Hotels</h1>

        <!-- Create table with column headers -->
        <table border="1">
          <tr><th>ID</th><th>Name</th><th>Rating</th><th>Phones</th><th>Address</th><th>NearestAirport</th></tr>

          <!-- Loop through each Hotel element -->
          <xsl:for-each select="/h:Hotels/h:Hotel">
            <tr>
              <!-- Display hotel attributes and elements -->
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="h:Name"/></td>
              <td><xsl:value-of select="@Rating"/></td>

              <!-- Join multiple phone numbers with commas -->
              <td>
                <xsl:for-each select="h:Phone">
                  <xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
                </xsl:for-each>
              </td>

              <!-- Format full address in one line -->
              <td>
                <xsl:value-of select="h:Address/h:Number"/> <xsl:value-of select="h:Address/h:Street"/>, <xsl:value-of select="h:Address/h:City"/>, <xsl:value-of select="h:Address/h:State"/> <xsl:value-of select="h:Address/h:Zip"/>
              </td>

              <!-- Display the NearstAirport attribute -->
              <td><xsl:value-of select="h:Address/@NearstAirport"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
