@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $("#bt-reset").click(function () {
                $("#mainForm")[0].reset();
            })

            $("#i-color-code").colorpicker({popover:false});

            $(".c-photo-group").show();
            $(".c-code-group").hide();
            $('input[type=radio][name=color]').on('change', function(){
                switch($(this).val()){
                    case 'photo' :
                    $(".c-photo-group").show();
                    $(".c-code-group").hide();
                    break;
                    case 'code' :
                    $(".c-code-group").show();
                    $(".c-photo-group").hide();
                    break;
                }            
            });
        });
    </script>
@endsection
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins pl-15 pr-15">
                @include('admin._partials._alert')
                <form role="form" method="POST" id="mainForm" action="{{route('admin.colors.store')}}">
                    {{ csrf_field() }}
                    @if (isset($data->id))
                        <input type="hidden" name="id" value="{{$data->id}}"/>
                    @endif
                    <div class="ibox-content">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Hình ảnh/Mã màu (<span
                                            class="text-danger">*</span>)</label>
                                <div class="col-md-5">
                                 <label for="photo" class="mr-15 lbl-ratio">
                                    <input type="radio" checked name="color" placeholder="" class="form-control m-b c-ratio-color" value="photo"/>Hình ảnh</label>
                                <label for="code" class="lbl-ratio"><input type="radio" name="color" placeholder="" class="form-control m-b c-ratio-color"
                                 value="code"/>Mã màu</label>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group c-photo-group">
                                <label class="col-md-2 control-label">Hình ảnh (<span
                                            class="text-danger">*</span>)</label>
                                <div class="col-md-5">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 134px;">
                                            <img src="" data-src="holder.js/100%x100%" alt=".">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"
                                             style="max-width: 200px; max-height: 134px;"></div>
                                        <div>
                                        <span class="btn btn-default btn-file">
                                            <span class="fileinput-new">Select image</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="photo">
                                        </span>
                                        <a href="#" class="btn btn-default fileinput-exists"
                                               data-dismiss="fileinput">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group c-code-group">
                                <label class="col-md-2 control-label">Mã màu (<span
                                            class="text-danger">*</span>)</label>
                                <div class="col-md-5">
                                    <input id="i-color-code" type="text" name="code" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->code)){{$data->code}}@else{{old('code')}}@endif"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Tên màu sắc (<span
                                            class="text-danger">*</span>)</label>
                                <div class="col-md-5">
                                    <input type="text" name="name" placeholder="" class="form-control m-b"
                                           value="@if(isset($data->name)){{$data->name}}@else{{old('name')}}@endif"/>
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
                            <a href="{{route('admin.colors.index')}}" class="btn btn-default"><i
                                        class="fa fa-arrow-circle-o-left"></i> Back to List</a>
                            <button type="button" class="btn btn-default" id="bt-reset"><i class="fa fa-refresh"></i>
                                Reset
                            </button>
                            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection