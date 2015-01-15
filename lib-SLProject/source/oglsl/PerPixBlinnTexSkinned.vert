//#############################################################################
//  File:      PerPixBlinnTex.vert
//  Purpose:   GLSL vertex program for per pixel Blinn-Phong lighting w. tex.
//  Author:    Marcus Hudritsch
//  Date:      July 2014
//  Copyright: 2002-2014 Marcus Hudritsch
//             This software is provide under the GNU General Public License
//             Please visit: http://opensource.org/licenses/GPL-3.0
//#############################################################################

attribute   vec4  a_position;    // Vertex position attribute
attribute   vec3  a_normal;      // Vertex normal attribute
attribute   vec2  a_texCoord;    // Vertex texture coordiante attribute
attribute   vec4 a_jointIds;
attribute   vec4 a_jointWeights;

uniform     mat4  u_mvMatrix;    // modelview matrix 
uniform     mat3  u_nMatrix;     // normal matrix=transpose(inverse(mv))
uniform     mat4  u_mvpMatrix;   // = projection * modelView

varying     vec3  v_P_VS;        // Point of illumination in view space (VS)
varying     vec3  v_N_VS;        // Normal at P_VS in view space
varying     vec2  v_texCoord;    // Texture coordiante varying

uniform mat4   u_jointMatrices[100];

//-----------------------------------------------------------------------------
void main(void)
{  
	mat4 jointTransform = 	u_jointMatrices[int(a_jointIds.x)] * a_jointWeights.x
						+ 	u_jointMatrices[int(a_jointIds.y)] * a_jointWeights.y
						+ 	u_jointMatrices[int(a_jointIds.z)] * a_jointWeights.z
						+ 	u_jointMatrices[int(a_jointIds.w)] * a_jointWeights.w;
                        
                                     
    v_P_VS = vec3(u_mvMatrix * jointTransform * a_position);
    v_N_VS = vec3(u_nMatrix * transpose(inverse(mat3(jointTransform))) * a_normal);  
    v_texCoord = a_texCoord;
    gl_Position = u_mvpMatrix * jointTransform * a_position;
}
//-----------------------------------------------------------------------------
