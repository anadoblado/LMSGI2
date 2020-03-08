<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Juego de tanques</title>
        <style>
          td {
            width: 50px;
            height: 50px;
            empty-cells: show;
          }
          .pared {
          background: blacK;
          }
          .tanque {
          background: red;
          }
        </style>
      </head>
      <body>
        <xsl:for-each select="jugadasGraficas/jugadaGrafica">
          <table border="3" align="center">
            <xsl:call-template name="bucleForFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!--
  
  -->
  <xsl:template name="bucleForFila">
    <xsl:param name="i"></xsl:param>
    <xsl:if test="$i &lt;=8">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i">
            <xsl:value-of select="$i"/>
          </xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i">
          <xsl:value-of select="$i + 1"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="y"/>
    <xsl:if test="$j &lt;=8"></xsl:if>
  </xsl:template>
  
</xsl:stylesheet>