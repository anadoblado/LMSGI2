<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:template match="primerDia1DAW">
    <html>
      <head>
        <title>HORARIO 1 DAW</title>
        <style>
          <!--thead td {
          background: #5077cc;
          color: #FFFFFF;
          }
          -->
          table img {
          width: 50px;
          }
          body{
          margin: 50px;
          padding: 0px;
          }
        </style>
      </head>
      <body>
        <table border="2">
          <thead>
            <td></td>
            <td>8:30-9:30</td>
            <td>9:30-10:30</td>
            <td>10:30-11:30</td>
            <td>12:00-13:00</td>
            <td>13:00-14:00</td>
            <td>14:00-15:00</td>
          </thead>
          <tbody>
            <xsl:for-each select="horario/dia">
              <tr>
                <td><xsl:value-of select="@desc"/></td>
                <xsl:for-each select="hora">
                  <xsl:sort select="@orden" order="ascending"/>
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">
                      <td style="background:#5077cc"><xsl:value-of select="."/></td>
                    </xsl:when>
                    <xsl:otherwise>
                       <td style="background:#FFFFFF"><xsl:value-of select="."/></td>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>