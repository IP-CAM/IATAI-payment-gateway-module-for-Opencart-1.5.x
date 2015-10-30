<?php echo $header; 

	$state=$this->request->post['reason_code'];
        if (isset($this->request->post['decision'])) {
            switch($this->request->post['decision']) {
                case 'ACCEPT' :
                    if (in_array($state, array('100','110'))) {
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
        $data['status_message'] = $status_message;
	$fields = array ('transaction_id',
			 'req_reference_number',
			 'req_amount',
			 'req_currency');
	foreach($fields as $key) {
		(( isset($_REQUEST[$key]) )? $data[$key] = $_REQUEST[$key] : $data[$key] = "");
	}	
	if ($this->config->get('iatai_test')) {
		echo '<center>';
		echo '<h1 style:"color: red;">Transacción en modo prueba<h1>';
	}	
?>

<h2 align="center">Datos de la transacción</h2>
<table width="400px" align="center" style="border: 1px solid black;  border-spacing: 0; border-spacing: 3px;
    border-collapse: separate;">
<tr>
<td bgcolor='#dddddd'>Estado</td>
<td bgcolor='#dddddd'><?php echo $status_message; ?> </td>
</tr>
<tr>
<tr>
<td bgcolor='#f4f4f4'>ID de la transaccion</td>
<td bgcolor='#f4f4f4'><?php echo $data['transaction_id']; ?> </td>
</tr>
<tr>
<td bgcolor='#dddddd'>Referencia de la Venta </td>
<td bgcolor='#dddddd'><?php echo $data['req_reference_number']; ?> </td> </tr>
<tr>
<td bgcolor='#f4f4f4'>Valor total</td>
<td bgcolor='#f4f4f4'>$<?php echo number_format($data['req_amount']); ?> </td>
</tr>
<tr>
<td bgcolor='#dddddd'>Moneda </td>
<td bgcolor='#dddddd'><?php echo $data['req_currency']; ?></td>
</tr>

</table>
<h3 align="center">Guarde esta información para referencias futuras</h3>
<br>
<?php 
echo $footer; ?>
