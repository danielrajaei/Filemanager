﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilemanagerCtrl.ascx.cs" Inherits="Filemanager.Ctrls.FilemanagerCtrl" %>
<link href="../Content/filemanager/icon.css" rel="stylesheet" />
<table class="col-xs-12 col-sm-12 col-md-12 col-lg-12 fm-table">
    <tr class="fm-topmenu">
        <td class="fm-menu" colspan="2">
            <div class="col-xs-offset-6 col-sm-offset-6 col-md-offset-4 col-lg-offset-4">
                <div class="btn-toolbar">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default" id="fm-btn-upload" data-toggle="tooltip" data-translate-title="uploadTitle" data-placement="bottom">
                            <div class="icon icon-upload"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-newfolder" data-toggle="tooltip" data-translate-title="addFolderTitle" data-placement="bottom">
                            <div class="icon icon-addFolder"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-newfile" data-toggle="tooltip" data-translate-title="addFileTitle" data-placement="bottom">
                            <div class="icon icon-addFile"></div>
                        </button>
                    </div>
                    <div class="btn-group fm-btngroup-open">
                        <button type="button" class="btn btn-default" id="fm-btn-openFile" data-toggle="tooltip" data-translate-title="viewTitle" data-placement="bottom">
                            <div class="icon icon-view"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-download" data-toggle="tooltip" data-translate-title="downloadTitle" data-placement="bottom">
                            <div class="icon icon-download"></div>
                        </button>
                    </div>
                    <div class="btn-group fm-btngroup-edit">
                        <button type="button" class="btn btn-default" id="fm-btn-copy" data-toggle="tooltip" data-translate-title="copyTitle" data-placement="bottom" value="Copy">
                            <div class="icon icon-copy"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-cut" data-toggle="tooltip" data-translate-title="cutTitle" data-placement="bottom" value="Cut">
                            <div class="icon icon-cut"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-paste" data-toggle="tooltip" data-translate-title="pasteTitle" data-placement="bottom" value="Paste">
                            <div class="icon icon-paste"></div>
                        </button>
                        <button type="button" class="btn btn-default" id="fm-btn-duplicate" data-toggle="tooltip" data-translate-title="duplicateTitle" data-placement="bottom" value="duplicate">
                            <div class="icon icon-duplicate"></div>
                        </button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default" id="fm-btn-delete" data-toggle="tooltip" data-translate-title="deleteTitle" data-placement="bottom" value="Delete">
                            <div class="icon icon-delete"></div>
                        </button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default" id="fm-btn-rename" data-toggle="tooltip" data-translate-title="renameTitle" data-placement="bottom" value="Rename">
                            <div class="icon icon-rename"></div>
                        </button>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td class="col-xs-6 col-sm-6 col-md-3 col-lg-3 fm-left">
            <ul class="fm-tree-directory">
                <li class="fm-dirname" data-value="<%= this.RootPath %>"><span class="fm-toggle-subtree"></span><label class="fm-dirname" data-translate-text="root"></label></li>
            </ul>
        </td>
        <td class="col-xs-6 col-sm-6 col-md-9 col-lg-9 fm-right">
            <ul class="fm-files"></ul>
        </td>
    </tr>
    <tr class="fm-statusbar">
        <td class="fm-attributes" colspan="2">
            <table class="fm-statusbar-content">
                <tr>
                    <td data-translate-text="fullAddress"></td>
                    <td>"<span class="fm-attr-address"></span>"</td>
                    <td style="padding-left: 20px;" data-translate-text="size"></td>
                    <td>"<span class="fm-attr-size"></span>"</td>
                    <td style="padding-left: 20px;" data-translate-text="creationDateTime"></td>
                    <td>"<span class="fm-attr-creationDate"></span>"</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div class="modal fade" id="uploadModal">
    <div class="modal-dialog">
        <div class="modal-content">
            </form>
            <form action="FilemanagerHandler.ashx" method="POST" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only" data-translate-text="close"></span></button>
                    <h4 class="modal-title" data-translate-text="uploadFile"></h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="opName" value="uplaodFile" />
                    <input type="hidden" name="dir" value="/" />
                    <p>
                        <input type="file" name="fileUpload" />
                    </p>
                </div>
                <div class="modal-footer">
                    <input type="submit" data-translate-value="submit" />
                </div>
            </form>
            <form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="newFolderModal">
    <div class="modal-dialog">
        <div class="modal-content">
            </form>
            <form action="FilemanagerHandler.ashx" method="POST" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only" data-translate-text="close"></span></button>
                    <h4 class="modal-title" data-translate-text="addNewFolder"></h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="opName" value="addFolder" />
                    <input type="hidden" name="dir" value="/" />
                    <p data-translate-text="promptFolderName"></p>
                    <p>
                        <input type="text" name="folderName" class="form-control" />
                    </p>
                </div>
                <div class="modal-footer">
                    <input type="submit" data-translate-value="submit" />
                </div>
            </form>
            <form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="newFileModal">
    <div class="modal-dialog">
        <div class="modal-content">
            </form>
            <form action="FilemanagerHandler.ashx" method="POST" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only" data-translate-text="close"></span></button>
                    <h4 class="modal-title" data-translate-text="addNewFile"></h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="opName" value="addFile" />
                    <input type="hidden" name="dir" value="/" />
                    <p data-translate-text="promptFileName"></p>
                    <p>
                        <input type="text" name="fileName" class="form-control" />
                    </p>
                </div>
                <div class="modal-footer">
                    <input type="submit" data-translate-value="submit" />
                </div>
            </form>
            <form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script type="text/javascript">

    var copies= {}, cuts= {}, paste= {};

    function ExtendTree(node, data) {
        $(node).children('ul').remove();
        if (data == "")
            return;
        var items = $.parseJSON(data);

        var subTree = $('<ul class="fm-subtree"></ul>');
        $(node).append(subTree);
        $.each(items, function (index, value) {
            $(subTree).append('<li class="fm-dirnode" data-value="' + value.Address + '"><div class="fm-toggle-subtree fm-icon-minifolder pull-left"></div><label class="fm-dirname">' + value.Title + '</label></li>');
        });
    }

    function ShowFiles(data, clearData) {
        if (clearData == undefined || clearData) {
            $('.fm-files').children().remove();
        }
        if (data == "")
            return;
        var items = $.parseJSON(data);
        $.each(items, function (index, value) {
            $('.fm-files').append('<li class="fm-filenode ui-widget-content" data-value="' + value.Address + '" data-size="' + value.FileSize + '" data-date="' + value.DateCreated + '" data-ext="' + value.Extension + '"><img src="/Content/filemanager/' + value.Extension + '.png" alt="alternative image" onerror="this.src=\'/Content/filemanager/UNKNOWN.png\'" width="56" /><p class="fm-filename">' + value.Title + '</p></li>');
        });
        //$('.fm-filenode').draggable({ revert: 'invalid', handle: 'img', zIndex: 1000 });
    }

    function clearAttributes() {
        $('[class^=fm-attr-]').text('');
    }

    function maskLoad(selector) {
        var offset = $(selector).offset();
        var mask = $('<div class="fm-mask" data-elem="' + selector + '"></div>');
        mask.offset({ top: offset.top, left: offset.left });
        mask.width($(selector).width());
        mask.height($(selector).height());
        $(document.body).prepend(mask);
    }

    function unmask(selector) {
        $('[data-elem="' + selector + '"]').remove();
    }
    
    function loadData(elem) {
        var folders;
        $.ajax({
            url: '/FilemanagerHandler.ashx',
            data: 'opName=getDirs&dir=/' + elem.attr('data-value'),
            success: function (data, textStatus, jqXHR) {
                folders = data;
                ExtendTree(elem, data);
                $('.fm-tree-selected').removeClass('fm-tree-selected');
                $(elem).toggleClass('fm-tree-selected');
            },
            complete: function () {
                $.ajax({
                    url: '/FilemanagerHandler.ashx',
                    data: 'opName=getFiles&dir=/' + elem.attr('data-value'),
                    success: function (data, textStatus, jqXHR) {
                        ShowFiles(folders);
                        ShowFiles(data, false);
                        //ShowFiles(data);
                    },
                    complete: function () {
                        unmask('.fm-right');
                    }
                });
            }
        });
        paste = '/' + elem.attr('data-value');
    }

    $(document).ready(function () {
        loadData($('.fm-tree-directory li:first'));
        $('.fm-tree-directory').on('click', '.fm-dirname', function () {
            clearAttributes();
            var selectedItem = $(this).parent('li');
            if (selectedItem.attr('data-value') == undefined)
                return;
            maskLoad('.fm-right');
            loadData(selectedItem);
        });

        $('.fm-tree-directory').on('click', '.fm-toggle-subtree', function () {
            clearAttributes();
            if ($(this).parent('li').children('.fm-subtree').length === 0) {
                $(this).next('.fm-dirname').click();
            }
            else { $(this).parent('li').children('.fm-subtree').slideToggle(); }
        });
        $('.fm-files').selectable({ cancel: ".ui-selected" });
        $('[data-translate-title]').each(function (index, value) { $(value).attr('title', (Lang[$(value).attr('data-translate-title')])); });
        $('[data-translate-text]').each(function (index, value) { $(value).text(Lang[$(value).attr('data-translate-text')]); });
        $('[data-translate-value]').each(function (index, value) { $(value).val(Lang[$(value).attr('data-translate-value')]); });

        $('button').tooltip();
        $('.fm-btngroup-open>button').prop('disabled', true);
        $('.fm-btngroup-edit>button').prop('disabled', true);
        $('#fm-btn-rename').prop('disabled', true);
        $('#fm-btn-delete').prop('disabled', true);
    });

    function getFileSize(fileSize) {
        if (fileSize < 1024)
            return fileSize + "B";
        else if (fileSize < 131072)
            return (fileSize / 1024).toFixed(2) + "KB";
        else
            return (fileSize / 131072).toFixed(2) + "MB";
    }

    function ShowFileAttrib() {
        var obj = $('.fm-files').find('li.ui-selected');
        $('.fm-attr-address').text($(obj).attr('data-value'));
        $('.fm-attr-size').text(getFileSize($(obj).attr('data-size')));
        var createdDateObj = new Date($(obj).attr('data-date'));
        $('.fm-attr-creationDate').text(createdDateObj.toLocaleDateString() + " " + createdDateObj.toLocaleTimeString());
        if ($(obj).attr('data-ext').toLowerCase() == 'folder')
            paste = $(obj).attr('data-value');
    }
    
    function ShowFilesAttrib() {
        var obj = $('.fm-files').find('li.ui-selected');
        $('.fm-attr-address').text('');
        var si = 0;
        $('.fm-files>li.ui-selected').each(function (index, value) { si += parseInt($(value).attr('data-size')); });
        $('.fm-attr-size').text(getFileSize(si));
        $('.fm-attr-creationDate').text('-');
        if ($(obj).attr('data-ext').toLowerCase() == 'folder')
            paste = $(obj).attr('data-value');
    }
    
    function Reload() {
        maskLoad('.fm-right');
        loadData($('.fm-tree-selected'));
    }

    //$('.fm-files').on('mousedown', '.fm-filenode', function (event) {
    //    //SelectFile(this);
    //    switch (event.which) {
    //        case 1:
    //            break;
    //        case 3:
    //            //show context menu
    //            break;
    //    }
    //});

    $(".fm-files").on("selectablestop", function (event, ui) {
        var selectedNumber = $('.fm-files').find('li.ui-selected').length;
        if (selectedNumber == 0) {
            $('.fm-btngroup-open>button').prop('disabled',true);
            $('.fm-btngroup-edit>button').prop('disabled', true);
            $('#fm-btn-rename').prop('disabled', true);
            $('#fm-btn-delete').prop('disabled', true);
            $('#fm-btn-paste').prop('disabled', copies.length == 0 && cuts.length == 0);
            clearAttributes();
        }
        else if (selectedNumber == 1) {
            $('.fm-btngroup-open>button').prop('disabled', false);
            $('.fm-btngroup-edit>button').prop('disabled', false);
            $('#fm-btn-rename').prop('disabled', false);
            $('#fm-btn-delete').prop('disabled', false);
            $('#fm-btn-paste').prop('disabled', copies.length==0 && cuts.length==0);
            ShowFileAttrib();
        }
        else if (selectedNumber > 1) {
            $('.fm-btngroup-open>button').prop('disabled', true);
            $('.fm-btngroup-edit>button').prop('disabled', true);
            $('#fm-btn-rename').prop('disabled', true);
            $('#fm-btn-delete').prop('disabled', false);
            $('#fm-btn-paste').prop('disabled', copies.length == 0 && cuts.length == 0);
            ShowFilesAttrib();
        }
    });

    function getUrlParam(paramName) {
        var reParam = new RegExp('(?:[\?&]|&)' + paramName + '=([^&]+)', 'i');
        var match = window.location.search.match(reParam);

        return (match && match.length > 1) ? match[1] : null;
    }

    $('.fm-files').on('dblclick', '.fm-filenode', function (event) {
        if ($(this).attr('data-ext') == "folder") {
            $('.fm-dirnode[data-value="' + $(this).attr('data-value') + '"]>.fm-toggle-subtree').click();
        } else {
            var funcNum = getUrlParam('CKEditorFuncNum');
            window.opener.CKEDITOR.tools.callFunction(funcNum, "/" + $(this).attr('data-value'));
            window.close();
        }
    });

    $('#fm-btn-upload').click(function () {
        $('#uploadModal').modal('show');
    });

    $('#fm-btn-newfolder').click(function () {
        $('#newFolderModal').modal('show');
    });

    $('#fm-btn-newfile').click(function () {
        $('#newFileModal').modal('show');
    });

    $('#fm-btn-openFile').click(function () {
        window.open($('.fm-files').find('li.ui-selected').attr('data-value'));
    });

    $('#fm-btn-download').click(function () {
        window.open('/FilemanagerHandler.ashx?opName=dlFile&dir=' + $('.fm-files').find('li.ui-selected').attr('data-value'));
    });

    $('#fm-btn-copy').click(function () {
        copy($('.fm-files').find('li.ui-selected'));
    });

    $('#fm-btn-cut').click(function () {
        cut($('.fm-files').find('li.ui-selected'));
    });

    $('#fm-btn-paste').click(function () {
        if (copies.length > 0) {
            copies.each(function() {
                $.ajax({
                    url: '/FilemanagerHandler.ashx',
                    data: 'opName=copy&dir1=' + paste + '&dir2=/' + $(this).attr('data-value'),
                });
            });
            maskLoad('.fm-right');
            loadData($('.fm-tree-selected'));
        }
        else if (cuts.length > 0) {
            cuts.each(function() {
                $.ajax({
                    url: '/FilemanagerHandler.ashx',
                    data: 'opName=cut&dir1=' + paste + '&dir2=/' + $(this).attr('data-value'),
                });
            });
            maskLoad('.fm-right');
            loadData($('.fm-tree-selected'));
        }
    });

    $('#fm-btn-delete').click(function () {
        $('.fm-files').find('li.ui-selected').each(function(index,value) {
            $.ajax({
                url: '/FilemanagerHandler.ashx',
                data: 'opName=delete&dir=' + $(value).attr('data-value'),
                complete: function() {
                    maskLoad('.fm-right');
                    loadData($('.fm-tree-selected'));
                }
            });
        });
        maskLoad('.fm-right');
        loadData($('.fm-tree-selected'));
    });

    $('#fm-btn-rename').click(function () {
        var obj = $('.fm-files').find('li.ui-selected').append('<textarea class="fm-txt-rename form-control" type="text" >'+ $('.fm-files>li.ui-selected>.fm-filename').text() + '</textarea>');
        $('.fm-files>li.ui-selected>.fm-filename').hide();
        $('.fm-files>li.ui-selected>textarea').focus();
        $('.fm-files>li.ui-selected>textarea').select();
        $('.fm-txt-rename').blur(function () {
            renameFile(this);
        });
        $('.fm-txt-rename').keypress(function (e) {
            if (e.which == 13) {
                renameFile(this);
            }
        });
    });
    
    function renameFile(obj) {
        var rename = $(obj).val();
        $(obj).hide();
        $.ajax({
            url: '/FilemanagerHandler.ashx',
            data: 'opName=rename&dir=' + $(obj).parent('.fm-filenode').attr('data-value') + '&name=' + rename,
            success: function (data) {
                var item = $.parseJSON(data)[0];
                $(obj).prev('p').text(item.Title).show().parent('.fm-filenode').attr('data-value', item.Address).attr('data-ext', item.Extension).attr('data-date', item.CreatedDate);
                $(obj).remove();
            }
        });
    }

    $('#fm-btn-duplicate').click(function () {
        $.ajax({
            url: '/FilemanagerHandler.ashx',
            data: 'opName=copy&dir1=' + $('.fm-tree-selected').attr('data-value') + '&dir2=' + $('.fm-files').find('li.ui-selected').attr('data-value'),
            complete: function () {
                maskLoad('.fm-right');
                loadData($('.fm-tree-selected'));
            }
        });
    });

    function copy(obj) {
        $('.fm-copy').removeClass('fm-copy');
        $('.fm-cut').removeClass('fm-cut');
        $(obj).addClass('fm-copy');
        cuts = {};
        copies = $(obj);
    }

    function cut(obj) {
        $('.fm-copy').removeClass('fm-copy');
        $('.fm-cut').removeClass('fm-cut');
        $(obj).addClass('fm-cut');
        copies = {};
        cuts = $(obj);
    }
</script>
