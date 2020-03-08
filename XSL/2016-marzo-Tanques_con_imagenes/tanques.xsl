<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Juego de tanques</title>
        <style>
          thead td {
           background: #58a3d1;
           color: #FFFFFF;
          }
          table img {
            width: 50px;
          }
        </style>
      </head>
      <dody>
        <table border="3" width="90%">
          <thead>
            <td>Jugada</td>
            <td>Jugador</td>
            <td>Imagen</td>
            <td>Descripción</td>
          </thead>
          <tbody>
            <xsl:for-each select="jugadasDescritas/jugada">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">
                  <xsl:call-template name="pintaFila">
                    <xsl:with-param name="color">#b3f0f2</xsl:with-param>
                    <xsl:with-param name="numeroJugador"><xsl:value-of select="@jugador"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="pintaFila">
                    <xsl:with-param name="color">#FFFFFF</xsl:with-param>
                    <xsl:with-param name="numeroJugador"><xsl:value-of select="@jugador"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </tbody>
        </table>
      </dody>
    </html>
  </xsl:template>
  
  <!--
  
  -->
  <xsl:template name="pintaFila">
    <xsl:param name="color"/>
    <xsl:param name="numeroJugador"/>

    <tr style="background: {$color}">
      <td>
        <xsl:value-of select="position()"/>
      </td>
      <td>
        <xsl:value-of select="@jugador"/>
      </td>
      <td>
        <img src="{/juegoTanques/tanques/imagenTanque[@jugador=$numeroJugador]}"/>
      </td>
      <td>
        <xsl:value-of select="@desc"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>