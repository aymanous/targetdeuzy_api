<?php

include_once "application/libraries/utils.php";
include_once "application/models/model.php";


$action = qp("action", "GET");

switch ($action) {
    case 'signin':
        $res = getGenericRow("users", "*", "WHERE username='" . qp("username") . "' and password='" . qp("password") . "'");
        $data = $res ? $res : -1;
        break;

    case 'signup':
        $id = insertGenericRow("users", "lastname,firstname,username,password", "'" . qp("lastname") . "','" . qp("firstname") . "','" . qp("username") . "','" . qp("password") . "'");
        $data = $id ? getGenericRow("users", "*", "WHERE id=" . $id) : -1;
        break;

    case 'getSpaces':
        $data = getGenericRows("spaces", "*", "WHERE userId=" . qp("userId") . " and deleted=0");
        break;

    case 'getSpace':
        $data = getGenericRow("spaces", "*", "WHERE id=" . qp("id"));
        break;

    case 'createSpace':
        $data = insertGenericRow("spaces", "name,userId", "'" . qp("name") . "','" . qp("userId") . "'");
        break;

    case 'updateSpace':
        $data = updateGenericRow("spaces", "name", qp("name"), "WHERE id=" . qp("id"));
        break;

    case 'deleteSpace':
        $data = updateGenericRow("spaces", "deleted", "1", "WHERE id=" . qp("id"));
        break;

    case 'getIndicators':
        $data = getGenericRows("indicators", "*", "WHERE spaceId=" . qp("spaceId") . " and deleted=0");
        break;

    case 'getIndicator':
        $data = getGenericRow("indicators", "*", "WHERE id=" . qp("id"));
        break;

    case 'createIndicator':
        $data = insertGenericRow("indicators", "name,type,spaceId", "'" . qp("name") . "','" . qp("type") . "','" . qp("spaceId") . "'");
        break;

    case 'updateIndicator':
        $data = updateGenericRow("indicators", "name", qp("name"), "WHERE id=" . qp("id"));
        break;

    case 'deleteIndicator':
        $data = updateGenericRow("indicators", "deleted", "1", "WHERE id=" . qp("id"));
        break;

    case 'newEntry':
        $data = insertGenericRow("entries", "spaceId,date", "'" . qp("spaceId") . "','" . qp("date") . "'");
        break;

    case 'newEntryValue':
        $data = insertGenericRow("entries_values", "entryId,indicatorId,value", "'" . qp("entryId") . "','" . qp("indicatorId") . "','" . qp("value") . "'");
        break;

    case 'getIndicatorEntryOccurences':
        $data = getGenericRows("entries_values", "value,count(value) as occurence", "WHERE indicatorId=" . qp("indicatorId") . " GROUP BY value");
        break;

    case 'getNumericIndicatorEntryOccurences':
        $data = callProcedureRows("getNumericIndicatorEntryOccurences", qp("indicatorId"));
        break;

    case 'getUserEntriesByDate':
        $data = callProcedureRows("getUserEntriesByDate", "'" . qp("date") . "'," . qp("userId"));
        break;

    case 'getEntryIndicatorsValues':
        $data = callProcedureRows("getEntryIndicatorsValues", "'" . qp("entryId") . "'");
        break;

    case 'getUser':
        $data = qp("id") ? getGenericRow("users", "*", "WHERE id=" . qp("id")) : -1;
        break;

    case 'updateUser':
        updateGenericRow("users", "lastname", qp("lastname"), "WHERE id=" . qp("id"));
        updateGenericRow("users", "firstname", qp("firstname"), "WHERE id=" . qp("id"));
        updateGenericRow("users", "username", qp("username"), "WHERE id=" . qp("id"));
        $data = true;
        break;

    case 'updateUserPassword':
        updateGenericRow("users", "password", qp("password"), "WHERE id=" . qp("id"));
        $data = true;
        break;

    default:
        $data = [];
        break;
}

if (isset($data)) echo json_encode($data);
