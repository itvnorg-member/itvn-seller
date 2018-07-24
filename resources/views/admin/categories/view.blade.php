@extends('admin.layouts.inspinia.master')

@section('title', $title)

@section('js')
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {
            $("#bt-reset").click(function(){
                $("#mainForm")[0].reset();
            })
        });
    </script>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins pl-15 pr-15">
            @include('admin._partials._alert')
            <form role="form" method="POST" id="mainForm" action="{{route('admin.categories.store')}}">
                {{ csrf_field() }}
                @if (isset($data->id))
                    <input type="hidden" name="id" value="{{$data->id}}" />
                @endif
                <div class="ibox-content">
                    <div class="row">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tên danh mục (<span class="text-danger">*</span>)</label>
                            <div class="col-md-5">
                                <input type="text" name="name" placeholder="" class="form-control m-b" value="@if(isset($data->name)){{$data->name}}@else{{old('name')}}@endif"/>
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
                            <label class="col-md-2 control-label">Cấp</label>
                            <div class="col-md-5">
                                <input type="text" name="level" placeholder="" class="form-control m-b" value="@if(isset($data->level)){{$data->level}}@else{{old('level')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Thứ tự</label>
                            <div class="col-md-5">
                                <input type="text" name="order" placeholder="" class="form-control m-b" value="@if(isset($data->order)){{$data->order}}@else{{old('order')}}@endif"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Trạng thái</label>
                            <div class="col-md-3">
                                <select class="form-control" name="active">
                                    <option @if(isset($data->active) && $data->active === ACTIVE || old('active') === ACTIVE) selected @endif value="{{ACTIVE}}">Đã kích hoạt</option>
                                    <option @if(isset($data->active) && $data->active === INACTIVE || old('active') === INACTIVE) selected @endif value="{{INACTIVE}}">Chưa kích hoạt</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="text-right">
                        <a href="{{route('admin.categories.index')}}" class="btn btn-default"><i class="fa fa-arrow-circle-o-left"></i> Back to List</a>
                        <button type="button" class="btn btn-default" id="bt-reset"><i class="fa fa-refresh"></i> Reset</button>
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection