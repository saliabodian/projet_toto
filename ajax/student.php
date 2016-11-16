<?php

include '../inc/config.php';

	// print_r($_POST['stu_id']) ;

    //Récupération des infos envoyés POST à partir de la requête AJAX

	$studentId= isset($_POST['stu_id'])?$_POST['stu_id'] : '';

	// print_r($studentId);

	$sql = '
	SELECT 
    student.stu_id,
    student.stu_lname,
    student.stu_fname,
    stu_email,
    country.cou_name,
    student.training_tra_id,
    city.cit_name,
    student.city_cit_id,
    stu_image,
	CASE student.stu_friendliness
    WHEN 1 THEN "Pas sympa"
    WHEN 2 THEN "Assez sympa"
    WHEN 3 THEN "Sympa"
    WHEN 4 THEN "Très sympa"
    WHEN 5 THEN "Génial"
	END as stu_friendliness,
	(2016-student.stu_age) as birthdate
	FROM 
    student
        LEFT OUTER JOIN
    city ON city.cit_id = student.city_cit_id	
    	LEFT OUTER JOIN
	country ON country.cou_id = city.country_cou_id
	where student.stu_id= :studentId
	';

	$pdoStatement=$pdo->prepare($sql);
	$pdoStatement->bindValue(':studentId', $studentId, PDO::PARAM_INT);
	if (!($pdoStatement->execute())){
	print_r($pdoStatement->errorInfo());
	}else{
		//je récupére mes données
		$studentDetailListe = $pdoStatement->fetch();
//		print_r($studentDetailListe);
	}

?>


<div class="panel-body">
	<table class="table">
		<tbody>
		<tr>
			<td colspan=2 align="center"><img src="<?= $studentDetailListe['stu_image'] ?>"></td>
		</tr>
		<tr>
			<td>Nom et Prénom</td>
			<td><?= $studentDetailListe['stu_lname'].' '.$studentDetailListe['stu_fname'] ?></td>
		</tr>

		<tr>
			<td>Email</td>
			<td><?= $studentDetailListe['stu_email'] ?></td>
		</tr>
		<tr>
			<td>Date de naissance</td>
			<td><?= $studentDetailListe['birthdate'] ?></td>
		</tr>
		<tr>
			<td>Ville</td>
			<td><?= $studentDetailListe['cit_name'] ?></td>
		</tr>
		<tr>
			<td>Pays</td>
			<td><?= $studentDetailListe['cou_name'] ?></td>
		</tr>
		<tr>
			<td colspan=2> 
				<a class="btn btn-default form-control" href="update.php?student_id=<?= $_GET['student_id'] ?>">modifier</a>
			</td>
		</tr>
		</tbody>
	</table>
</div>


