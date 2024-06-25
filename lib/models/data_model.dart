class dataModel {
  SensorData? sensorData;

  dataModel({this.sensorData});

  dataModel.fromJson(Map<String, dynamic> json) {
    sensorData = json['sensor_data'] != null
        ? new SensorData.fromJson(json['sensor_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sensorData != null) {
      data['sensor_data'] = this.sensorData!.toJson();
    }
    return data;
  }
}

class SensorData {
  ForceSensor? forceSensor;
  Mpu6050? mpu6050;

  SensorData({this.forceSensor, this.mpu6050});

  SensorData.fromJson(Map<String, dynamic> json) {
    forceSensor = json['force_sensor'] != null
        ? new ForceSensor.fromJson(json['force_sensor'])
        : null;
    mpu6050 =
    json['mpu6050'] != null ? new Mpu6050.fromJson(json['mpu6050']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forceSensor != null) {
      data['force_sensor'] = this.forceSensor!.toJson();
    }
    if (this.mpu6050 != null) {
      data['mpu6050'] = this.mpu6050!.toJson();
    }
    return data;
  }
}

class ForceSensor {
  int? fsr1;
  int? fsr2;
  int? fsr3;

  ForceSensor({this.fsr1, this.fsr2, this.fsr3});

  ForceSensor.fromJson(Map<String, dynamic> json) {
    fsr1 = json['fsr1'];
    fsr2 = json['fsr2'];
    fsr3 = json['fsr3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fsr1'] = this.fsr1;
    data['fsr2'] = this.fsr2;
    data['fsr3'] = this.fsr3;
    return data;
  }
}

class Mpu6050 {
  int? angleX;
  int? angleY;
  int? angleZ;

  Mpu6050({this.angleX, this.angleY, this.angleZ});

  Mpu6050.fromJson(Map<String, dynamic> json) {
    angleX = json['angle_x'];
    angleY = json['angle_y'];
    angleZ = json['angle_z'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['angle_x'] = this.angleX;
    data['angle_y'] = this.angleY;
    data['angle_z'] = this.angleZ;
    return data;
  }
}
