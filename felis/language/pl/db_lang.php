<?php
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.2.4 or newer
 *
 * NOTICE OF LICENSE
 *
 * Licensed under the Open Software License version 3.0
 *
 * This source file is subject to the Open Software License (OSL 3.0) that is
 * bundled with this package in the files license.txt / license.rst.  It is
 * also available through the world wide web at this URL:
 * http://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to obtain it
 * through the world wide web, please send an email to
 * licensing@ellislab.com so we can send you a copy immediately.
 *
 * @package		CodeIgniter
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc. (http://ellislab.com/)
 * @license		http://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */
defined('BASEPATH') OR exit('No direct script access allowed');

$lang['db_invalid_connection_str'] = 'Nie można określić ustawień bazy danych na podstawie podanego "connection string".';
$lang['db_unable_to_connect'] = 'Nie można połączyć się z bazą danych używając podanych ustawień.';
$lang['db_unable_to_select'] = 'Nie można wybrać bazy danych: %s';
$lang['db_unable_to_create'] = 'Nie można stworzyć bazy danych: %s';
$lang['db_invalid_query'] = 'Zapytanie jest niepoprawne.';
$lang['db_must_set_table'] = 'Musisz określić tabelę, której ma dotyczyć zapytanie.';
$lang['db_must_use_set'] = 'Musisz użyć metody "set" do zaktualizowania wpisu.';
$lang['db_must_use_index'] = 'You must specify an index to match on for batch updates.';
$lang['db_batch_missing_index'] = 'One or more rows submitted for batch updating is missing the specified index.';
$lang['db_must_use_where'] = 'Operacja "update" nie jest dopuszczalna bez klauzuli "where".';
$lang['db_del_must_use_where'] = 'Operacja "delete" nie jest dopuszczalna bez kluzuli "where" lub "like".';
$lang['db_field_param_missing'] = 'Pobieranie danych wymaga podania nazwy tabeli jako parametru.';
$lang['db_unsupported_function'] = 'Nieobsługiwana funkcja przez bazę danych, której używasz.';
$lang['db_transaction_failure'] = 'Transakcja nieudana: wykonano rollback.';
$lang['db_unable_to_drop'] = 'Nie można usunąć wybranej bazy danych.';
$lang['db_unsuported_feature'] = 'Nieobsługiwana właściwość przez bazę danych, której używasz.';
$lang['db_unsuported_compression'] = 'Wybrany format kompresji pliku nie jest obsługiwany przez Twój serwer.';
$lang['db_filepath_error'] = 'Nie można zapisać danych w ścieżce pliku, którą podałeś.';
$lang['db_invalid_cache_path'] = 'Ścieżka cache jest niepoprawna lub brak prawa zapisu.';
$lang['db_table_name_required'] = 'Nazwa tabeli jest wymagana aby wykonać tą operację.';
$lang['db_column_name_required'] = 'Nazwa kolumny jest wymagana aby wykonać tą operację.';
$lang['db_column_definition_required'] = 'Definicja kolumny jest wymagana aby wykonać tą operację.';
$lang['db_unable_to_set_charset'] = 'Nie można ustawić kodowania znaków połączenia klienta: %s';
$lang['db_error_heading'] = 'Wystąpił błąd bazy danych.';     
                                     
/* End of file db_lang.php */
/* Location: ./system/language/english/db_lang.php */