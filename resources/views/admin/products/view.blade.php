@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $("#bt-reset").click(function () {
                $("#mainForm")[0].reset();
            })

            $('.summernote').summernote();
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
                    <div class="ibox-content">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Tên sản phẩm (<span
                                            class="text-danger">*</span>)</label>
                                <div class="col-md-5">
                                    <input type="text" name="name" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->name)){{$data->name}}@else{{old('name')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Barcode</label>
                                <div class="col-md-5">
                                    <input type="text" name="barcode" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->barcode)){{$data->barcode}}@else{{old('barcode')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Đơn giá</label>
                                <div class="col-md-5">
                                    <input type="text" name="price" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->price)){{$data->price}}@else{{old('price')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Giá bán</label>
                                <div class="col-md-5">
                                    <input type="text" name="sell_price" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->sell_price)){{$data->sell_price}}@else{{old('sell_price')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Số lượng</label>
                                <div class="col-md-5">
                                    <input type="text" name="quantity" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->quantity)){{$data->quantity}}@else{{old('quantity')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Kích thước</label>
                                <div class="col-md-5">
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
                                <label class="col-md-2 control-label">Mô tả</label>
                                <div class="col-md-5">
                                    <textarea name="description" id="" cols="30" rows="10"  class="form-control m-b">@if(isset($data->description)){{$data->description}}@else{{old('description')}}@endif</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nội dung</label>
                                <div class="col-md-5">
                                    <div class="summernote form-control m-b">@if(isset($data->content)){{$data->content}}@else{{old('content')}}@endif</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Thứ tự</label>
                                <div class="col-md-5">
                                    <input type="text" name="order" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->order)){{$data->order}}@else{{old('order')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Trạng thái</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="active">
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

                        <div class="text-right">
                            <a href="{{route('admin.products.index')}}" class="btn btn-default"><i
                                        class="fa fa-arrow-circle-o-left"></i> Trở lại</a>
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
                </form>
            </div>
        </div>
    </div>
@endsection