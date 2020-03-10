<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:template match="primerDia1DAW">
    <html>
     <head>
        <title>HORARIO 1 DAW</title>
        <style>
          img {
          width: 50px;
          }
          td {
          width: 75px;
          height: 75px;
          empty-cells: show;
          }
          .puerta {
          background: #ff543a;
          }
          .parde {
          background: #fccf53;
          }
          .ventana {
          background: #bfd7ff; 
          }
        </style>
      </head>
      <body>
        <xsl:for-each select="estructuraAula/bloque">
          <table border="2" align="center">
            <xsl:call-template name="bucleForFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
        </xsl:for-each>  
    </body>
  </html>
  </xsl:template>

  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 11">
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
    <xsl:if test="$j &lt;= 8">
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
      <xsl:for-each select="bloque">
        <xsl:if test="@x = $x and @y = $y">
          <xsl:choose>
            <xsl:when test="@tipo = 'puerta'">
              <xsl:attribute name="class">puerta</xsl:attribute>
            </xsl:when>
             <xsl:when test="@tipo = 'pared'">
              <xsl:attribute name="class">pared</xsl:attribute>
            </xsl:when>
             <xsl:when test="@tipo = 'ventana'">
              <xsl:attribute name="class">ventana</xsl:attribute>
            </xsl:when>
          
          
          </xsl:choose>
          
         
        
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
<!--<xsl:call-template name="imagenAlum">
            <xsl:with-param name="tipo">
              <xsl:value-of select="@tipo"/>
            </xsl:with-param>
          </xsl:call-template> -->
 
  
  <xsl:template name="imagenAlum">
    <xsl:param name="tribu"></xsl:param>
    <img src="{/gormitis/gormiti[@tribu = $tribu]}"/>
  </xsl:template>


</xsl:stylesheet>