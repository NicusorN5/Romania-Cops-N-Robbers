g_Attach <- {}

function attachEntity(object,entity,offset)
{
 if( g_Attach.rawin( object.ID ) ) print( "Object is already attached to an entity" );
 g_Attach.rawset( object.ID, {
  "Object": object,
  "Entity": entity
  "Offset": offset,
 } );
}
function deattachEntity( object )
{
 if( !g_Attach.rawin( object.ID ) ) print( "Object is not attached to any entity" );
 g_Attach.rawdelete( object.ID );
}
function AttachUpdate()
{
 foreach( id, attach in g_Attach )
 {
  if ( attach["Object"].Pos.x == 0 )
  {
   g_Attach.rawdelete( id );
   continue;
  }
  
  if ( attach["Entity"].Pos.x == 0 )
  {
   g_Attach.rawdelete( id );
   continue;
  }
  
  attach["Object"].Pos = attach["Entity"].Pos + attach["Offset"];
 }
}

ATTACH_TIMER <- NewTimer("AttachUpdate",50,0);