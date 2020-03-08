<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1" />
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Pruebas</title>
        <style></style>
      </head>
      <body>
        <xsl:for-each select="superheroe">
          <xsl:choose>
            <xsl:when test="@nombre = 'Thor'">
              <xsl:call-template name="muestraTablaSuperheroe">
                <xsl:with-param name="color" select="'#FF0000'"/>
                <xsl:with-param name="imagen" select="'../image/Thor.jpg'"></xsl:with-param>
              </xsl:call-template>
              <xsl:otherwise>
                <xsl:call-template name="muestraTablaSuperheroe">
                  <xsl:with-param name="color" select="'#FF0000'"/>
                  <xsl:with-param name="imagen" select="'../image/Hulk.jpg'"></xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="muestraTablaSuperheroe">
    <xsl:param name="color"/>
    <xsl:param name="imagen"/>
    <div style="width: 400px; background:{$color}; position: left;">
      <table>
        <tr class="tituloTabla">
          <td colspan="2">
            <xsl:value-of select="@nombre"/>
          </td>
        </tr>
        <tr>
          <td rowspan="2">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="$imagen"/>
              </xsl:attribute>
            </img>
          </td>
          <td>
            <xsl:value-of select="concat('Poderes: ', @poderes)"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="concat('Amigos: ', @amigos)"/>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>