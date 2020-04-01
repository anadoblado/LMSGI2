<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/partidoBaloncesto">
		<html>
		   <head>
		      <title></title>
		      <xsl:call-template name="css"/>
		   </head>
		   <body>
		      <div style="width: 1000px; margin: 0 auto;">
		      <h1 align="center">Baloncesto: <xsl:value-of select="equipo[@tipo='Local']/@nombre"/> - <xsl:value-of select="equipo[@tipo='Visitante']/@nombre"/></h1>
		      
		      <xsl:call-template name="tablaJugadores"/>
		      <p/><p/>
		      <xsl:call-template name="cancha"/>
		      <p/><p/>
		      <xsl:call-template name="historico"/>
		      </div>
		   </body>
		</html>
	</xsl:template>
	
	
	<xsl:template name="tablaJugadores">
		<table border="1" width="100%">
			<tr>
				<th>Equipo</th>
				<th>Jugador</th>
				<th>Dorsal</th>
				<th>Apodo</th>
				<th>Puntos</th>
				<th>Rebotes</th>
				<th>Asistencias</th>				
			</tr>
			<xsl:for-each select="equipo">
				<xsl:for-each select="jugador">
				<xsl:sort select="@nombre"/>
					<tr>
						<xsl:choose>
							<xsl:when test="../@tipo = 'Local' and position() mod 2 = 1">
								<xsl:attribute name="bgcolor">#d8e7ff</xsl:attribute>
							</xsl:when>
							<xsl:when test="../@tipo = 'Visitante' and position() mod 2 = 1">
								<xsl:attribute name="bgcolor">#d8ffcc</xsl:attribute>
							</xsl:when>
						</xsl:choose>
						<td><img src="{../@imagen}"/></td>
						<td><xsl:value-of select="@nombre"/></td>
						<td><xsl:value-of select="@dorsal"/></td>
						<td><xsl:value-of select="@apodo"/></td>
						<td><xsl:value-of select="@puntos"/></td>
						<td><xsl:value-of select="@rebotes"/></td>
						<td><xsl:value-of select="@asistencias"/></td>
					</tr>
				</xsl:for-each>
			</xsl:for-each>
		</table>
	
	</xsl:template>
	
	
	
	
	<xsl:template name="cancha">
        <table width="100%" style="background: url('{/partidoBaloncesto/pista}') no-repeat;" id="tablaCancha">
	        <xsl:call-template name="bucleForFila">
	        	<xsl:with-param name="i">1</xsl:with-param>
	        </xsl:call-template>
        </table>
	</xsl:template>
	
	
	
	  <xsl:template name="bucleForFila">
	  	<xsl:param name="i"/>
	  	<xsl:if test="$i &lt;= 5">
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
	  	<xsl:if test="$j &lt;= 10">
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
	  	<td>
	  		<xsl:for-each select="/partidoBaloncesto/equipo/jugador">
	  			<xsl:if test="@posicionX = $x and @posicionY = $y">
	  				<img src="{../@imagen}"/>
	  				<xsl:value-of select="@nombre"/>
	  			</xsl:if>
	  		</xsl:for-each>
	  	</td>
	  </xsl:template>
	
	
	
	<xsl:template name="historico">
		<table align="center" border="1" width="50%">
			<tr>
				<th>Tiempo</th>
				<th>Jugador</th>
				<th>Apodo</th>
				<th>Descripcion</th>
				<th>Icono</th>
			</tr>
			<xsl:for-each select="historico/entrada">
				<xsl:variable name="tipo"><xsl:value-of select="@tipo"/></xsl:variable>
				<xsl:variable name="jugador"><xsl:value-of select="@jugador"/></xsl:variable>
				<tr>
					<td><xsl:value-of select="@tiempo"/></td>
					<td><xsl:value-of select="@jugador"/></td>
					<td><xsl:value-of select="/partidoBaloncesto/equipo/jugador[@nombre=$jugador]/@apodo"/></td>
					<td><xsl:value-of select="."/></td>
					<td><img src="{/partidoBaloncesto/historico/imagen[@tipo=$tipo]}"/></td>
				</tr>
			</xsl:for-each>		
		</table>
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