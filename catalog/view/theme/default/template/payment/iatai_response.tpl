<?php echo $header;
// asignar descripción del estado de la transacción 
$state=$this->request->post['reason_code'];
if (isset($this->request->post['decision'])) {
	switch($this->request->post['decision']) {
		case 'ACCEPT' :
			if (in_array($state, array('100','110')) {
				$status_message = 'Aprobada';
			}
			break;
		case 'REVIEW' :
			$status_message = 'Pendiente';
			break;
		case 'DECLINE' :
			$status_message = 'Rechazada';
			break;
		case 'CANCEL' :
			$status_message = 'Cancelada';
			break;
		case 'ERROR' :
			$status_message = 'Error en la transacción';
			break;
		default : 
			$status_message = 'Rechazada';
			break;
		}
	}
}
?>

<?php echo $footer; ?>
