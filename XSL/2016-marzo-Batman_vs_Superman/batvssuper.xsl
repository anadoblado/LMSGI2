<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/cine">
		<html>
		   <head>
		      <title>BatmanVSSuperman</title>
		      <xsl:call-template name="css"/>
		   </head>
		   <body>
		      <div style="width: 900px; margin: 0 auto;">
            <h3 align="center"><xsl:value-of select="@nombre"/></h3>
            <p/><p/>
            <h1><xsl:value-of select="titulo/@nombre"/></h1>
            <p></p>
            <img>
              <xsl:attribute name="src"><xsl:value-of select="titulo/imagen"/></xsl:attribute>
            </img>
            <h2 aligne="center">Fecha de estreno: <xsl:value-of select="titulo/@estreno"/></h2>
		      
		      <xsl:call-template name="tablaSesion"/>
		      <p/><p/>
		      <xsl:call-template name="cartelera"/>
		      </div>
		   </body>
		</html>
	</xsl:template>
	
	
	<xsl:template name="tablaSesion">
		<table border="1" width="100%">
      <xsl:for-each select="sesiones/sesion">
        <xsl:choose>
          <xsl:when test="position() mod 2 = 1">
            <xsl:call-template name="tablaSala">
              <xsl:with-param name="color">#99def7</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="tablaSala">
              <xsl:with-param name="color">#FFFFFF</xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
		</table>
	</xsl:template>
  
  <xsl:template name="tablaSala">
    <xsl:param name="color"/>
    <tr align="center">
      <td aling="center" style="background:{$color}">
        Sesión:
        <xsl:value-of select="position()"/>
        <p></p>
        <xsl:value-of select="@hora"/>
        <table border="1" aligne="center" width="70%">
        <xsl:call-template name="bucleForFila">
          <xsl:with-param name="i">1</xsl:with-param>
        </xsl:call-template>
        </table>
      </td>
    </tr>
  </xsl:template>
	
	
	
	
	<xsl:template name="cartelera">
    <table border="1" width="100%">
      <h3>Otras películas</h3>
      <xsl:for-each select="cartelera/pelicula">
        <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
        <tr>
          <td>
            <img style="width:500px" src="{/cine/imagenes/imagen[@id=$id]}"></img>
          </td>
          <td>
            <xsl:value-of select="@nombre"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
	
	
	
	  <xsl:template name="bucleForFila">
	  	<xsl:param name="i"/>
	  	<xsl:if test="$i &lt;= 4">
	  		<tr>
		  		<xsl:call-template name="bucleForColumna">
		  			<xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
		  			<xsl:with-param name="j">1</xsl:with-param>
		  		</xsl:call-template>
		  		<xsl:call-template name="bucleForFila">
		  			<xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
		  		</xsl:call-template>
	  		</tr>
	  	</xsl:if>
	  </xsl:template>
	
	
	  <xsl:template name="bucleForColumna">
	  	<xsl:param name="i"/>
	  	<xsl:param name="j"/> 
	  	<xsl:if test="$j &lt;= 4">
	  		<xsl:call-template name="celda">
	  			<xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
	  			<xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
	  		</xsl:call-template>
	  		<xsl:call-template name="bucleForColumna">
	  			<xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
	  			<xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
	  		</xsl:call-template>
	  	</xsl:if>
	  </xsl:template>
	

	  <xsl:template name="celda">
	  	<xsl:param name="x"/>
	  	<xsl:param name="y"/>
	  	<td aligne="center">
	  		<xsl:choose>
          <xsl:when test="ocupado[@fila=$y and @asiento=$x]">
            <img src="{/cine/imagenes/imagen[@id='ocupado']}"/>
          </xsl:when>
          <xsl:otherwise>
            <img src="{/cine/imagenes/imagen[@id='libre']}"/>
          </xsl:otherwise>
      </xsl:choose>
	  	</td>
	  </xsl:template>
	
	
	

	
	
	<xsl:template name="css">
      <style type="text/css">
                    body {
                    font-family: Arial;
                    font-size: 11px;
                    }
                    
                    table img {
                    	width: 40px;
                    }
                    
                    th {
                    	background: #1e3356;
                    	color: #FFFFFF;
                    }
                    
                    #tablaCancha {
                    	color: #eff4fc;
                    }
                    
                    ol, ul
                    {
                    margin-top: 10px;
                    margin-left: 0px;
                    }
                    
                    #menu li
                    {
                    margin-left: 0px;
                    display: inline;
                    list-style-type: none;
                    padding: 10px 50px;
                    }
                    
                    .noticia {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: left; 
                    width: 338px;
                    }
                    
                    .noticia img {
                    width: 338px;
                    }
                    
                    .noticiaDobleAncho {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: left; 
                    width: 690px;
                    }
                    
                    .noticiaDobleAncho img {
                    width: 690px;
                    }
                    
                    .fechaNoticia {
                    color: #A3A34B;
                    }
                    
                    .comentariosNoticia {
                    color: #A3A34B;
                    padding-left: 20px;
                    }
                    
                    .divPublicidad {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: right; 
                    width: 280px;                    }
                    }
                    
                    .divPublicidad img {
                    width: 200px;
                    }
   		</style>
	</xsl:template>
	
</xsl:stylesheet>