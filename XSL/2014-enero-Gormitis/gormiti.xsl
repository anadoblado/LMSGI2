<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>

  <xsl:template match="/gormitis">
    <html>
      <head>
        <title>GORMITIS</title>
        <style>
          thead td {
          background: #5077cc;
          color: #FFFFFF;
          }
          table img {
          width: 50px;
          }
        </style>
      </head>
      <body>
        <table border="1" width="50%">
          <thead>
            <td></td>
            <td>Gormiti</td>
            <td>Tribu</td>
          </thead>
          <tbody>
            <xsl:for-each select ="gormiti">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">
                  <xsl:call-template name="pintaFila">
                    <xsl:with-param name ="color">#c7d4f0</xsl:with-param>
                    <xsl:with-param name ="nomTribu"><xsl:value-of select ="@tribu"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name ="pintaFila">
                    <xsl:with-param name ="color">#fffff</xsl:with-param>
                    <xsl:with-param name ="nomTribu"><xsl:value-of select ="@tribu"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="pintaFila">
    <xsl:param name="color"/>
    <xsl:param name="nomTribu"/>

    <tr style ="background: {$color}">
      <td>
        <xsl:value-of select="position()"/>
      </td>
      <td>
        <img src="{/gormitis/gormiti[@tribu=$nomTribu]}"/>
      </td>
      <td>
        <xsl:value-of select ="@tribu"/>
      </td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>