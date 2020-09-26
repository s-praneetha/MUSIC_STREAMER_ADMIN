SELECT DISTINCT language FROM tbl_addalbum as alb,tbl_addalbumtype as albtype where  alb.album_type_id= albtype.type_id;

Select * from  tbl_addalbum as alb,tbl_addalbumtype as albtype where alb.album_type_id= albtype.type_id and alb.language in ('HINDI','TELUGU','ENGLISH');

Select distinct(alb.album_id),alb.album_name,alb.album_description,alb.language from  tbl_addalbum as alb,tbl_addtrack as track where  alb.album_id= 45;

SELECT * from tbl_addtrack as trk,tbl_addperformer as performer where trk.track_performer = performer.performer_id and trk.track_album=47;



