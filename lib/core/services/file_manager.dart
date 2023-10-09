// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileManager extends Equatable {
  FileManager({
    required Dio dio,
  }) : _dio = dio;
  final Dio _dio;

  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;

  Future<String> download({required String url, required String name,}) async {
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }

    _permissionReady = await _checkPermission();


    if (_permissionReady) {
      await _prepareSaveDir();
      await _dio.download(
        url,
        '$_localPath/$name',
        options: Options(
          validateStatus: (status) {
            return status! < 400;
          },
        ),
      );
    }

    return '$_localPath/$name';
  }

  Future<String> saveLocal({required File file, required String name,}) async {
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }

    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
      await file.copy('$_localPath/$name');
    }

    final filePath = '$_localPath/$name';

    return filePath;
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    final savedDir = Directory(_localPath);
    final hasExisted = await savedDir.exists();
    if (!hasExisted) {
      print('Создаю');
      await savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Avatar';
  }

  Future<void> deleteDirectory() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    final hasExisted = await savedDir.exists();
    if (hasExisted) {
      await savedDir.delete(recursive: true);
    }
  }

  @override
  List<Object?> get props => [
        _localPath,
        _permissionReady,
        platform,
      ];
}
