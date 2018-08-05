@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
<!-- Page-Level Scripts -->
<script>
    var url_delete = "{{route('admin.carts.delete')}}";
    var url_change_status = "{{route('admin.carts.changeStatus')}}";
    var table;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function formatDate(date) {
       var d = new Date(date),
       hour = d.getHours();
       minute = d.getMinutes();
       month = '' + (d.getMonth() + 1),
       day = '' + d.getDate(),
       year = d.getFullYear();

       if (month.length < 2) month = '0' + month;
       if (day.length < 2) day = '0' + day;

       return [hour, minute].join(':')+' '+[day, month, year].join('/');
    }

    //---> Get customer detail, cart detail
    function getRecordDetail(){
        $('#dataTables tbody > tr').click(function(){
            var cart_code = $(this).find('td:not(:empty):first').text();
            $.ajax({
                url: "{{route('admin.carts.getCartDetail')}}",
                data:{
                    cart_code:cart_code
                },
                dataType:'json'
            }).done(function(data) {
                // console.log(data);
                if (!$.isEmptyObject(data.result)) {
                    $("#customer_name").text(data.result.customer_name);
                    $("#customer_phone").text(data.result.customer_phone);
                    $("#customer_email").text(data.result.customer_email);
                    $("#customer_address").text(data.result.customer_address);
                    var dateFormat = formatDate(data.result.created_at);
                    $("#cart_created").text(dateFormat);
                    $("#supplier_name").text(data.result.supplier_name);
                    $("#transport_name").text(data.result.transport_name);
                    $("#transport_id").text(data.result.transport_id);
                    $("#code").text(data.result.code);
                }else{
                    console.log('Data is null');
                }
            }).fail(function(jqXHR, textStatus){
                console.log(textStatus);
            })

        });
    }

    $(document).ready(function () {
        $('#date_range_picker').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true
        });


        table = $('#dataTables').dataTable({
            searching: false,
            processing: true,
            serverSide: true,
            "dom": 'rt<"#pagination"flp>',
            ajax: {
                "url": "{{route('admin.carts.index')}}",
                "data": function (d) {
                    d.keyword = $('#s-keyword').val();
                    d.status = $('#s-status').val();
                },
                complete: function () {
                    var inputStatus = document.querySelectorAll('.js-switch');
                    var elems = Array.prototype.slice.call(inputStatus);

                    elems.forEach(function (elem) {
                        var switchery = new Switchery(elem, {size: 'small'});

                        elem.onchange = function () {
                            var id = $(elem).attr('data-id');
                            var name = $(elem).attr('data-name');
                            if (elem.checked) {
                                var status = 'kích hoạt';
                            } else {
                                var status = 'bỏ kích hoạt';
                            }

                            swal({
                                title: "Cảnh Báo!",
                                text: "Bạn có chắc muốn " + status + " <b>" + name + "</b> ?",
                                html: true,
                                type: "warning",
                                showCancelButton: true,
                                confirmButtonClass: "btn-danger",
                                confirmButtonText: "Chắc chắn!",
                                cancelButtonText: "Không",
                                closeOnConfirm: false
                            },
                            function (isConfirm) {
                                if (isConfirm) {
                                    $.ajax({
                                        url: url_change_status,
                                        type: 'PUT',
                                        data: {
                                            id: id,
                                            status: elem.checked
                                        },
                                        dataType: 'json',
                                        success: function (response) {
                                            if (response.success) {
                                                swal({
                                                    title: "Thành công!",
                                                    text: "Bạn đã " + status + " danh mục " + name + " thành công.",
                                                    html: true,
                                                    type: "success",
                                                    confirmButtonClass: "btn-primary",
                                                    confirmButtonText: "Đóng lại."
                                                });
                                            } else {
                                                errorHtml = '<ul class="text-left">';
                                                $.each(response.errors, function (key, error) {
                                                    errorHtml += '<li>' + error + '</li>';
                                                });
                                                errorHtml += '</ul>';
                                                swal({
                                                    title: "Error! Refresh page and try again.",
                                                    text: errorHtml,
                                                    html: true,
                                                    type: "error",
                                                    confirmButtonClass: "btn-danger"
                                                });
                                            }
                                        }
                                    });
                                } else {
                                    $(elem).prop('checked', !elem.checked);
                                    $(elem).parent().find(".switchery").trigger("click");
                                }
                            });
                        };
                    });

                    //---> Get customer detail
                    getRecordDetail();
                    $('#dataTables tbody > tr:first').click();
                },
            },
            columns: [
            {data: 'code'},
            {data: 'customer_name'},
            {data: 'customer_phone'},
            {data: 'created_at'},
            {data: 'supplier_name'},
            {data: 'status'},
            ],
            "aoColumnDefs": [
                    // Column index begins at 0
                    {"sClass": "text-center", "aTargets": [2]},
                    {"sClass": "text-right", "aTargets": [3]}
                    ],
                    "language": {
                        "decimal": "",
                        "emptyTable": "Không có dữ liệu hợp lệ",
                        "info": "Hiển thị từ _START_ đến _END_ / _TOTAL_ kết quả",
                        "infoEmpty": "Hiển thị từ 0 đến 0 trên 0 dòng",
                        "infoFiltered": "(filtered from _MAX_ total entries)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Hiển thị _MENU_ kết quả",
                        "loadingRecords": "Đang tải...",
                        "processing": "Đang xử lý...",
                        "search": "Search:",
                        "zeroRecords": "Không có kết quả nào được tìm thấy",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Tiếp",
                            "previous": "Trước"
                        },
                        "aria": {
                            "sortAscending": ": activate to sort column ascending",
                            "sortDescending": ": activate to sort column descending"
                        }
                    }

                });

$('#fSearch').submit(function () {
    table.fnDraw();
    return false;
});

$('#bt-reset').click(function () {
    $('#fSearch')[0].reset();
    table.fnDraw();
});
});

$("#dataTables").on("click", '.bt-delete', function () {
    var name = $(this).attr('data-name');
    var data = {
        ids: [$(this).attr('data-id')]
    };
    swal({
        title: "Cảnh Báo!",
        text: "Bạn có chắc muốn xóa <b>" + name + "</b> ?",
        html: true,
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Vâng, xóa!",
        closeOnConfirm: false
    },
    function () {
        $.ajax({
            url: url_delete,
            type: 'DELETE',
            data: data,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    swal({
                        title: "Thành công!",
                        text: "Danh mục " + name + " đã bị xóa.",
                        html: true,
                        type: "success",
                        confirmButtonClass: "btn-primary",
                        confirmButtonText: "Đóng lại."
                    });
                } else {
                    errorHtml = '<ul class="text-left">';
                    $.each(response.errors, function (key, error) {
                        errorHtml += '<li>' + error + '</li>';
                    });
                    errorHtml += '</ul>';
                    swal({
                        title: "Error! Refresh page and try again.",
                        text: errorHtml,
                        html: true,
                        type: "error",
                        confirmButtonClass: "btn-danger"
                    });
                }
                table.fnDraw();
            }
        });

    });
});
</script>
@endsection
@section('content')
<div class="row">
    <!-- Search form -->
    <form role="form" id="fSearch">
        <div class="row v-center">
            <div class="col-sm-2 pr-0">
                <div class="form-group">
                    <label>Mã đơn hàng</label>
                    <input type="text" placeholder="Nhập mã" name="keyword" id="s-keyword" class="form-control"
                    value="{{app('request')->input('keyword')}}">
                </div>
            </div>

            <div class="col-sm-2 pr-0 pl-10">
                <div class="form-group">
                    <label>Tên khách hàng</label>
                    <input type="text" placeholder="Nhập tên" name="keyword" id="s-keyword" class="form-control"
                    value="{{app('request')->input('keyword')}}">
                </div>
            </div>

            <div class="col-sm-2 pr-0 pl-10">
                <div class="form-group">
                    <label>Điện thoại</label>
                    <input type="text" placeholder="Điện thoại" name="keyword" id="s-keyword" class="form-control"
                    value="{{app('request')->input('keyword')}}">
                </div>
            </div>

            <div class="col-sm-4 pr-0 pl-10 w-28-per">
                <div class="form-group">
                    <label>Ngày bán</label>
                    <div class="input-daterange input-group" id="date_range_picker">
                        <input type="text" class="input-sm form-control" name="start" value="05/14/2014">
                        <span class="input-group-addon lbl-to">to</span>
                        <input type="text" class="input-sm form-control" name="end" value="05/22/2014">
                    </div>
                </div>
            </div>

            <div class="col-sm-2 pr-0 pl-10">
                <div class="form-group">
                    <label>Nguồn đơn</label>
                    <input type="text" placeholder="Nguồn đơn" name="keyword" id="s-keyword" class="form-control"
                    value="{{app('request')->input('keyword')}}">
                </div>
            </div>

            <div class="col-sm-2 pr-0 pl-10">
                <div class="form-group">
                    <label>Tình trạng</label>
                    <select class="form-control" name="status" id="s-status">
                        <option value=""> -- Tất cả --</option>
                        <option @if(app('request')->has('status') && app('request')->input('status') == ACTIVE) selected
                            @endif value="{{ACTIVE}}">Đã kích hoạt
                        </option>
                        <option @if(app('request')->has('status') && app('request')->input('status') == INACTIVE) selected
                            @endif value="{{INACTIVE}}">Chưa kích hoạt
                        </option>
                    </select>
                </div>
            </div>
            <div class="col-sm-3 pl-10">
                <div class="form-group">
                    <label></label>
                    <button class="btn btn-sm btn-warning" type="submit" style="margin-bottom: 0;margin-top: 22px;">
                        <i class="fa fa-search"></i> Tìm kiếm
                    </button>
                    <button class="btn btn-sm btn-default" type="button" id="bt-reset"
                    style="margin-bottom: 0;margin-top: 22px; margin-right:5px">
                    <i class="fa fa-refresh"></i> Làm mới
                </button>
            </div>

        </div>
    </div>
</form>
</div>
<div class="row">
    <div class="col-md-8">
        <div class="ibox float-e-margins">
            @include('admin._partials._alert')
            <div class="ibox-content">
                <div class="text-left">
                    <h3 class="text-uppercase">Danh sách đơn hàng</h3>
                </div>
                <!-- <div class="text-right" style="padding: 10px 10px 0px 10px;">
                    <a href="{{route('admin.carts.create')}}" class="btn btn-sm btn-primary"><i
                        class="fa fa-plus"></i> Tạo Danh Mục</a>
                    </div> -->
                    <div class="hr-line-dashed"></div>
                    <!-- Account list -->
                    <table class="table table-striped table-hover" id="dataTables">
                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Điện thoại</th>
                                <th>Ngày Tạo</th>
                                <th>Nguồn đơn</th>
                                <th>Tình trạng</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="text-left">
                        <h3 class="text-uppercase">thông tin khách hàng</h3>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Tên khách hàng:</label>
                            <label id="customer_name" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Số điện thoại:</label>
                            <label id="customer_phone" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Email:</label>
                            <label id="customer_email" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Địa chỉ:</label>
                            <label id="customer_address" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Ngày mua:</label>
                            <label id="cart_created" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Nguồn đơn:</label>
                            <label id="supplier_name" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Nhà vận chuyển:</label>
                            <label id="transport_name" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Mã vận đơn:</label>
                            <label id='transport_id' class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Mã đơn hàng:</label>
                            <label id="code" class="col-lg-7 text-left control-label" style="padding-left: 0; text-align: left;"></label>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-5 control-label" style="text-align: left; padding-right: 0; width: 33.666667%;">Tình trạng:</label>
                            <div class="col-lg-7" style="padding-left: 0; text-align: left;">
                                <select class="form-control m-b" name="status">
                                    <option>Hoàn thành</option>
                                    <option>Đang giao</option>
                                    <option>Chưa giao</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="text-left">
                            <h3 class="text-uppercase">thông tin đơn hàng</h3>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10 text-right">
                                <button class="btn btn-sm btn-primary" type="submit">Lưu</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @endsection