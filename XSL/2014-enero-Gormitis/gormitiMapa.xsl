<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="iso-8859-1" />
  <xsl:template match="/gormitis">
    <html>
      <head>
        <title>Gormitis</title>
        <style type="text/css">
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
        <xsl:for-each select="tablero/gormitiEnMapa">
          <table border="1" align="center">
            <xsl:call-template name="bucleForFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>


  <xsl:template name="imagenGormiti">
    <xsl:param name="volcan"/>
    
      <img src="{/gormitis/tablero/gormitiEnMapa[@tribu=$volcan]}"></img>
    
  </xsl:template>


  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 3">
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
    <xsl:param name="j"/>
    <xsl:if test="$j &lt;=3">
      <xsl:call-template name="celda">
        <xsl:with-param name="x">
          <xsl:value-of select="$j"/>
        </xsl:with-param>
        <xsl:with-param name="y">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
        <xsl:with-param name="j">
          <xsl:value-of select="$j + 1"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td>
      <xsl:for-each select="tablero/gormitiEnMapa">
        <xsl:if test="@x = $x and @y = $y">
          <xsl:call-template name="imagenGormitiEnMapa"></xsl:call-template>
          <xsl:value-of select="@tribu"/>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template name="imagenGormitiEnMapa">
    <xsl:param name="tribu"></xsl:param>
  </xsl:template>
</xsl:stylesheet>
