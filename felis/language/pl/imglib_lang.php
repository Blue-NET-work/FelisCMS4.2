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
                                                                                                 
$lang['imglib_source_image_required'] = 'Musisz podać obraz źródłowy w ustawieniach.';
$lang['imglib_gd_required'] = 'Biblioteka GD jest wymagana przez tą funkcjonalność.';
$lang['imglib_gd_required_for_props'] = 'Twój serwer musi obsługiwać bibliotekę GD aby określić parametry obrazu.';
$lang['imglib_unsupported_imagecreate'] = 'Serwer nie obsługuje funkcji biblioteki GD wymaganej do przetworzenia tego typu obrazu.';
$lang['imglib_gif_not_supported'] = 'Obrazy GIF często nie są obsługiwane ze względów licencyjnych.  Spróbuj użyć obrazu JPG lub PNG.';
$lang['imglib_jpg_not_supported'] = 'Obrazy JPG nie są obsługiwane.';
$lang['imglib_png_not_supported'] = 'Obrazy PNG nie są obsługiwane.';
$lang['imglib_jpg_or_png_required'] = 'Metoda zmiany rozmiaru wybrana w ustawieniach działa tylko z obrazami JPEG oraz PNG.';
$lang['imglib_copy_error'] = 'Wystąpił błąd podczas próby nadpisania pliku.  Upewnij się, że katalog ma prawa zapisu.';
$lang['imglib_rotate_unsupported'] = 'Obracanie obrazu najprawdopodobniej nie jest obsługiwane przez serwer.';
$lang['imglib_libpath_invalid'] = 'Ścieżka do biblioteki graficznej jest niepoprawna.  Ustaw poprawną ścieżkę w ustawieniach obrazu.';
$lang['imglib_image_process_failed'] = 'Przetwarzanie obrazu zakończyło się niepowodzeniem.  Upewnij się, że serwer obsługuje wybraną metodę oraz że ścieżka do biblioteki graficznej jest poprawna.';
$lang['imglib_rotation_angle_required'] = 'Wymagany jest kąt o jaki obraz ma być obrócony.';
$lang['imglib_writing_failed_gif'] = 'Obraz GIF.';
$lang['imglib_invalid_path'] = 'Ścieżka do obrazu nie jest poprawna.';
$lang['imglib_copy_failed'] = 'Kopiowanie obrazu nie powiodło się.';
$lang['imglib_missing_font'] = 'Nie można odnaleźć czcionki do użycia.';
$lang['imglib_save_failed'] = 'Nie można zapisać obrazu.  Upewnij się czy obraz i katalog mają prawa zapisu.';

/* End of file imglib_lang.php */
/* Location: ./system/language/english/imglib_lang.php */