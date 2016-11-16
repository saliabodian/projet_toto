
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3>Etudiant détails</h3>
	</div>
	<!-- Ajout d'une div vide avec l'id studentCoontent pour le remplissage du résultat -->
	<div id="studentContent">
		
	</div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Ajax calls -->

<script type="text/javascript">
			$(document).ready(function() {
			
				$.ajax({
					url : 'ajax/student.php',
					type : 'post',
					dataType : 'html',
					data : { 
						   stu_id : <?=  $_GET['student_id'] ?>
						}
				// remplissage de la dive dont l'id est studentContent avec la fonction .done
				}).done(function ( data ) {
				   $('#studentContent').append(data);
				});	
			/*	done(function( data ) {
					    if ( console && console.log ) {
					      console.log( "Sample of data:", data.slice( 0, 100 ) );
					    }
				 });
			*/

		});

</script>