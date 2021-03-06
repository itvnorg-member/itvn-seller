@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
    <script></script>
    <!-- Page-Level Scripts -->
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#preview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(document).ready(function() {

            $("#bt-reset").click(function(){
                $("#mainForm")[0].reset();
            });

            $.validator.addMethod("valueNotEquals", function(value, element, arg){
                return arg !== value;
            }, "Value must not equal arg.");

            $("#mainForm").validate({
                rules: {
                    code:{
                        maxlength:20
                    },
                    group_customer_id: { valueNotEquals: "0" }
                },
                messages: {
                    group_customer_id: { valueNotEquals: "Vui lòng chọn!" }
                }
            });

            new Cleave('.input-phone', {
                phone: true,
                phoneRegionCode: 'VN'
            });

        });
    </script>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins pl-15 pr-15">
            @include('admin._partials._alert')
            <form role="form" method="POST" id="mainForm" action="{{route('admin.customers.store')}}" enctype="multipart/form-data">
                {{ csrf_field() }}
                @if (isset($data->id))
                    <input type="hidden" name="id" value="{{$data->id}}" />
                @endif
                <div class="ibox-content" style="padding: 20px;">
                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nhóm Khách Hàng (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <select class="form-control" name="group_customer_id">
                                    <option value="0">-- Chọn nhóm khách hàng --</option>
                                    @foreach($groups as $group)
                                        <option value="{{$group->id}}" @if(isset($data->group_customer_id) && $data->group_customer_id === $group->id) selected @endif>{{$group->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Họ Tên (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <input type="text" name="name" placeholder="Nhập tên của bạn" class="form-control required" value="@if(isset($data->name)){{$data->name}}@else{{old('name')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Email (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <input type="text" name="email" placeholder="Nhập email của bạn" class="form-control required email" value="@if(isset($data->email)){{$data->email}}@else{{old('email')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Mã Khách Hàng (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <input type="text" readonly name="code" class="form-control required" value="@if(isset($data->code)){{$data->code}}@else{{old('code')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Điện Thoại (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <input type="text" name="phone" placeholder="VD: 090 934 128" class="form-control input-phone required" value="@if(isset($data->phone)){{$data->phone}}@else{{old('phone')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Địa Chỉ</label>
                            <div class="col-md-5">
                                <input type="text" name="address" placeholder="VD: 5 Lữ Gia, phường 15, quận 11" class="form-control" value="@if(isset($data->address)){{$data->address}}@else{{old('address')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Ghi Chú</label>
                            <div class="col-md-5">
                                <textarea class="form-control" name="description" cols="10" rows="5">@if(isset($data->description)){{$data->description}}@else{{old('description')}}@endif</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row m-b">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Trạng Thái</label>
                            <div class="col-md-3">
                                <select class="form-control" name="active">
                                    <option @if(isset($data->active) && $data->active === ACTIVE || old('active') === ACTIVE) selected @endif value="{{ACTIVE}}">Đã kích hoạt</option>
                                    <option @if(isset($data->active) && $data->active === INACTIVE || old('active') === INACTIVE) selected @endif value="{{INACTIVE}}">Chưa kích hoạt</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="text-right">
                        <a href="{{route('admin.customers.index')}}" class="btn btn-default"><i class="fa fa-arrow-circle-o-left"></i> Trở lại</a>
                        <button type="button" class="btn btn-default" id="bt-reset"><i class="fa fa-refresh"></i> Làm mới</button>
                        <button type="submit" name="action" class="btn btn-primary" value="save"><i class="fa fa-save"></i> Lưu</button>
                        <button type="submit" name="action" class="btn btn-warning" value="save_quit"><i class="fa fa-save"></i> Lưu &amp; Thoát</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection