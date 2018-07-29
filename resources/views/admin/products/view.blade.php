@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
<!-- Page-Level Scripts -->
<script>

    function deleteProductInfoItem(elRow) {
        var tblRow = elRow.closest('tr');
        if (tblRow !== null) {
            tblRow.remove();
            calculateQuantity();
        }
    }

    var sum = 0;
    function calculateQuantity(){
        // iterate through each td based on class and add the values
        $(".c-quantity").each(function() {

            var value = $(this).text();
            // add only if the value is number
            if(!isNaN(value) && value.length != 0) {
                sum += parseFloat(value);
            }

        });
        console.log(sum);
        $('.c-total-quantities').text(sum);
        $('.c-quatity-input').val(sum);
        sum = 0;
    }

    $(document).ready(function () {
        $( "#mainForm" ).submit(function( event ) {
            var searchIDs = $("#mainForm .list-tree-section input:checkbox:checked").map(function(){
              return $(this).val();
          }).get();
          $('input[name="categories"]').val(searchIDs);
      });

        $("#bt-reset").click(function () {
            $("#mainForm")[0].reset();
        })

        $("#mainForm").validate();

        //---> Init summer note
        $('.summernote').summernote();

        //---> Add row for table
        var elColorVal = "";
        var elSizeVal = "";
        var elQuantityVal = "";

        function resetVal(){
            $("#i-color-selection").val("");
            $("#i-size-selection").val("");
            $("#i-quantity-input").val("");
            elColorVal = "";
            elSizeVal = "";
            elQuantityVal = "";
        }

        $("#i-color-selection").change(function(){
            elColorVal = $(this).val();
            console.log(elColorVal);
        });

        $("#i-size-selection").change(function(){
            elSizeVal = $(this).val();
            console.log(elSizeVal);
        });

        $("#i-quantity-input").change(function(){
            elQuantityVal = $(this).val();
            console.log(elQuantityVal);
        });

        var index = 0;
        $('.c-add-info').click(function(){
            if (elColorVal != "" && elSizeVal != "" && elQuantityVal != "") {
                $('#i-product-info tbody').prepend('<tr class="child '+index+'"><td><a class="'+index+'" href="javascript:;" onclick="deleteProductInfoItem(this);">Delete</a></td><td>'+elColorVal+'</td><td>'+elSizeVal+'</td><td class="c-quantity">'+elQuantityVal+'</td></tr>');
                calculateQuantity();
                index++;
                resetVal();
            }else{
                alert("Nhập sai rồi Phước ơi");
            }
        });

        $('.c-total-quantities').text(sum);

    });
</script>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins pl-15 pr-15">
            @include('admin._partials._alert')
            <form role="form" method="POST" id="mainForm" action="{{route('admin.products.store')}}"
            enctype="multipart/form-data">
            {{ csrf_field() }}
            @if (isset($data->id))
            <input type="hidden" name="id" value="{{$data->id}}"/>
            @endif
            <input type="hidden" name="categories" value="@if(isset($categories)){{$categories}}@endif"/>
            <div class="ibox-content">

                <div class="row">
                    <div class="col-md-12">
                        <div class="tabs-container m-b">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tab-3" aria-expanded="true">Thông tin sản phẩm</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">Bộ sưu tập</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-5" aria-expanded="false">Meta SEO</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-3" class="tab-pane active">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Tên sản phẩm (<span class="text-danger">*</span>)</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="name" placeholder="" class="form-control required m-b"
                                                            value="@if(isset($data->name)){{$data->name}}@else{{old('name')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Mã sản phẩm</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="code" placeholder="" class="form-control m-b"
                                                            value="@if(isset($data->code)){{$data->code}}@else{{old('code')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Số lượng</label>
                                                        <div class="col-md-9">
                                                            <input disabled type="text" name="quantity" placeholder="0" class="form-control m-b c-quatity-input"
                                                            value="@if(isset($data->quantity)){{$data->quantity}}@else{{old('quantity')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Barcode</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="barcode" placeholder="" class="form-control m-b"
                                                            value="@if(isset($data->barcode)){{$data->barcode}}@else{{old('barcode')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Đơn giá</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="price" placeholder="" class="form-control m-b"
                                                            value="@if(isset($data->price)){{$data->price}}@else{{old('price')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Giá bán</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="sell_price" placeholder="" class="form-control m-b"
                                                            value="@if(isset($data->sell_price)){{$data->sell_price}}@else{{old('sell_price')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row hidden">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Kích thước</label>
                                                        <div class="col-md-9">
                                                            <select name="sizes" id="" class="form-control m-b">
                                                                <option value="">-- Chọn kích thước --</option>
                                                                <option value="">Size XL</option>
                                                                <option value="">Size L</option>
                                                                <option value="">Size M</option>
                                                                <option value="">Size S</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Mô tả (<span class="text-danger">*</span>)</label>
                                                        <div class="col-md-9">
                                                            <textarea name="description" id="" cols="30" rows="10"  class="form-control required m-b">@if(isset($data->description)){{$data->description}}@else{{old('description')}}@endif</textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Nội dung</label>
                                                        <div class="col-md-9">
                                                            <div class="summernote form-control m-b">@if(isset($data->content)){{$data->content}}@else{{old('content')}}@endif</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Thứ tự</label>
                                                        <div class="col-md-9">
                                                            <input type="text" name="order" placeholder="" class="form-control m-b"
                                                            value="@if(isset($data->order)){{$data->order}}@else{{old('order')}}@endif"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">Trạng thái</label>
                                                        <div class="col-md-3">
                                                            <select class="form-control m-b" name="active">
                                                                <option @if(isset($data->active) && $data->active === ACTIVE || old('active') === ACTIVE) selected
                                                                    @endif value="{{ACTIVE}}">Đã kích hoạt
                                                                </option>
                                                                <option @if(isset($data->active) && $data->active === INACTIVE || old('active') === INACTIVE) selected
                                                                    @endif value="{{INACTIVE}}">Chưa kích hoạt
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-3">
                                                            <button type="button" class="btn btn-success pull-right c-add-info">Thêm</button>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="color" id="i-color-selection" class="form-control">
                                                                <option value="" disabled selected>-- Chọn màu --</option>
                                                                <option value="Đỏ">Đỏ</option>
                                                                <option value="Trắng">Trắng</option>
                                                                <option value="Vàng">Vàng</option>
                                                                <option value="Hồng">Hồng</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="sizes" id="i-size-selection" class="form-control">
                                                                <option value="" disabled selected>-- Chọn kích thước --</option>
                                                                <option value="Lớn">Lớn</option>
                                                                <option value="Nhỏ">Nhỏ</option>
                                                                <option value="Vừa">Vừa</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input id="i-quantity-input" type="text" name="quantity" placeholder="0" class="form-control m-b"
                                                            value=""/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <table id="i-product-info" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Màu sắc</th>
                                                                        <th>Kích thước</th>
                                                                        <th>Số lượng</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>Tổng số lượng: <span class="c-total-quantities"></span></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <h5>Danh mục sản phẩm</h5>
                                                <div class="list-tree-section m-b">
                                                    {!! $categoriesTree !!}
                                                </div>
                                                <!-- BEGIN: Product photo -->
                                                <div class="c-product-photo">
                                                    @if(!isset($data->photo) || empty($data->photo) || $data->photo === '' )
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div class="fileinput-new thumbnail" style="width: 140px; height: 140px;">
                                                            <img data-src="holder.js/100%x100%" alt="..." src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzE0MHgxNDAKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNjRjN2E0MDNlNSB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE2NGM3YTQwM2U1Ij48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA1NDY4NzUiIHk9Ijc0LjUiPjE0MHgxNDA8L3RleHQ+PC9nPjwvZz48L3N2Zz4=">
                                                        </div>
                                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 140px; max-height: 140px;"></div>
                                                        <div>
                                                            <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="photo"></span>
                                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                                        </div>
                                                    </div>
                                                    @else
                                                    <div class="fileinput fileinput-exists" data-provides="fileinput">
                                                        <div class="fileinput-new thumbnail" style="width: 140px; height: 140px;">
                                                            <img data-src="holder.js/100%x100%" alt="..." src="">
                                                        </div>
                                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 140px; height: 140px;">
                                                            <img data-src="holder.js/100%x100%" alt="{{$data->name}}" src="{{asset('storage/' .$data->photo)}}" data-holder-rendered="true">
                                                        </div>
                                                        <div>
                                                            <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="photo"></span>
                                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                                        </div>
                                                    </div>
                                                    @endif
                                                </div>
                                                <!-- END: Product photo -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-4" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="dropzone" id="dropzoneForm">
                                            <div class="fallback">
                                                <input name="file" type="file" multiple />
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                                <div id="tab-5" class="tab-pane">
                                    <div class="panel-body">
                                        <strong>Donec quam felis</strong>

                                        <p>Thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects
                                        and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath </p>

                                        <p>I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite
                                        sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-right">
                            <a href="{{route('admin.products.index')}}" class="btn btn-default"><i class="fa fa-arrow-circle-o-left"></i> Trở lại</a>
                            <button type="button" class="btn btn-default" id="bt-reset"><i class="fa fa-refresh"></i>
                                Làm mới
                            </button>
                            <button type="submit" name="action" class="btn btn-primary" value="save"><i
                                class="fa fa-save"></i> Lưu
                            </button>
                            <button type="submit" name="action" class="btn btn-warning" value="save_quit"><i
                                class="fa fa-save"></i> Lưu &amp; Thoát
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
@endsection