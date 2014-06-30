﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilemanagerCtrl.ascx.cs" Inherits="Filemanager.Ctrls.FilemanagerCtrl" %>
<table class="col-xs-12 col-sm-12 col-md-12 col-lg-12 fm-table">
    <tr>
        <td class="col-xs-12 col-sm-12 col-md-3 col-lg-3 fm-left">
            <ul class="fm-tree-directory">
                <li>Root</li>
            </ul>
        </td>
        <td class="col-xs-12 col-sm-12 col-md-9 col-lg-9 fm-right">
            <ul class="fm-files"></ul>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function ExtendTree(node, data) {
        $(node).children('ul').remove();
        if (data == "")
            return;
        var items = $.parseJSON(data);
        var subTree = $('<ul class="fm-subtree"></ul>');
        $(node).append(subTree);
        $.each(items, function (index, value) {
            $(subTree).append('<li class="fm-dirnode" value="' + value.Address + '"><span class="fm-toggle-subtree">-</span><label class="fm-dirname">' + value.Title + '</label></li>');
        });
    }

    function ShowFiles(data) {
        $('.fm-files').children().remove();
        if (data == "")
            return;
        var items = $.parseJSON(data);
        $.each(items, function (index, value) {
            $('.fm-files').append('<li class="fm-filenode" value="' + value.Address + '"><img src="/Content/filemanager/' + value.Extension + '.png" alt="alternative image" onerror="this.src=\'/Content/filemanager/'+value.Category+'.png\'" /><label class="fm-filename">' + value.Title + '</label></li>');
        });
        //$('.fm-filenode').sortable({ revert: true });
        $('.fm-filenode').draggable({ revert: 'invalid', handle: 'img', zIndex: 1000 });
    }

    $(document).ready(function () {
        $.ajax({
            url: '/FilemanagerHandler.ashx',
            data: 'opName=getDirs&dir=<%= this.RootPath %>',
            success: function (data, textStatus, jqXHR) {
                ExtendTree($('.fm-tree-directory li:first'), data);
            },
        });
        $.ajax({
            url: '/FilemanagerHandler.ashx',
            data: 'opName=getFiles&dir=<%= this.RootPath %>',
            success: function (data, textStatus, jqXHR) {
                ShowFiles(data);
            },
        });
        $('.fm-tree-directory').on('click', '.fm-dirname', function () {
            var selectedItem = $(this).parent('li');
            $.ajax({
                url: '/FilemanagerHandler.ashx',
                data: 'opName=getDirs&dir=/' + selectedItem.attr('value'),
                success: function (data, textStatus, jqXHR) {
                    ExtendTree(selectedItem, data);
                },
            });
            $.ajax({
                url: '/FilemanagerHandler.ashx',
                data: 'opName=getFiles&dir=/' + selectedItem.attr('value'),
                success: function (data, textStatus, jqXHR) {
                    ShowFiles(data);
                },
            });
        });

        $('.fm-tree-directory').on('click', '.fm-toggle-subtree', function () {
            if ($(this).parent('li').children('.fm-subtree').length === 0) {
                $(this).next('.fm-dirname').click();
            }
            else { $(this).parent('li').children('.fm-subtree').slideToggle(); }
        });
    });
</script>