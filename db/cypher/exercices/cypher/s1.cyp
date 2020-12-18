CREATE
  (`0` :n1 {`FR.fuser`:'u01',`US.uid`:'u01',`US.name`:'Date'}) ,
  (`1` :n2 {`FR.blog`:'b02',`BG.bid`:'b02',`BG.bname`:'Database',`BG.admin`:'u01'}) ,
  (`2` :n3 {`TG.tcomment`:'c01',`CT.cid`:'c01',`CT.cuser`:'u01',`CT.cblog`:'b01',`CT.msg`:"exactly what I looking for!",`CT.date`:'25/02/2013'}) ,
  (`3` :n4 {`FR.fblog`:'b01',`BG.bname`:'Information Systems',`BG.admin`:'u02',`BG.bid`:'b01'}) ,
  (`4` :n5 {`FR.fblog`:'b03',`BG.bname`:"Computer Science",`BG.admin`:'u02',`BG.bid`:'b03'}) ,
  (`5` :n6 {`TG.tuser`:'u02',`FR.fuser`:'u02',`US.name`:'Hunter',`US.uid`:'u02'}) ,
  (`0`)-[:`BLOG_ADMIN` ]->(`1`),
  (`0`)-[:`COMMENT_CUSER` ]->(`2`),
  (`0`)-[:`FOLLOWE_FUSER` ]->(`1`),
  (`0`)-[:`FOLLOWE_FUSER` ]->(`3`),
  (`0`)-[:`FOLLOWER_FUSER` ]->(`4`),
  (`5`)-[:`BLOG_ADMIN` ]->(`3`),
  (`5`)-[:`BLOG_ADMIN` ]->(`4`),
  (`5`)-[:`TAG_TUSER` ]->(`2`)

MATCH (n:n3) SET n.`CT.cblog`= "Databases"

MATCH (p) where ID(p)=172 DELETE p