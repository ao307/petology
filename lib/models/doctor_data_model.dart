class DoctorDataModel {
  DoctorDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.nationalId,
    this.email,
    this.phoneNumber,
    this.gender,
    this.birthDate,
    this.bloodType,
    this.maritalStatus,
    this.image,
    this.isActive,
    this.createdAt,
    this.salary,
    this.department,
    this.isAdmin,
    this.shifts,
    this.role,
    this.available,
    this.description,
    this.maxPatientNumber,
    this.appointmentPrice,
    this.staffType,
    this.fullName,
    this.age,
    this.links,
  });

  DoctorDataModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nationalId = json['national_id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    bloodType = json['blood_type'];
    maritalStatus = json['marital_status'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    salary = json['salary'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    isAdmin = json['is_admin'];
    if (json['shifts'] != null) {
      shifts = [];
      json['shifts'].forEach((v) {
        shifts?.add(Shifts.fromJson(v));
      });
    }
    role = json['role'];
    available = json['available'];
    description = json['description'];
    maxPatientNumber = json['max_patient_number'];
    appointmentPrice = json['appointment_price'];
    staffType = json['staff_type'];
    fullName = json['full_name'];
    age = json['age'];
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  int? id;
  String? firstName;
  String? lastName;
  int? nationalId;
  String? email;
  String? phoneNumber;
  bool? gender;
  String? birthDate;
  String? bloodType;
  String? maritalStatus;
  Image? image;
  bool? isActive;
  String? createdAt;
  double? salary;
  Department? department;
  bool? isAdmin;
  List<Shifts>? shifts;
  String? role;
  bool? available;
  String? description;
  int? maxPatientNumber;
  double? appointmentPrice;
  String? staffType;
  String? fullName;
  int? age;
  Links? links;

  DoctorDataModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? nationalId,
    String? email,
    String? phoneNumber,
    bool? gender,
    String? birthDate,
    String? bloodType,
    String? maritalStatus,
    Image? image,
    bool? isActive,
    String? createdAt,
    double? salary,
    Department? department,
    bool? isAdmin,
    List<Shifts>? shifts,
    String? role,
    bool? available,
    String? description,
    int? maxPatientNumber,
    double? appointmentPrice,
    String? staffType,
    String? fullName,
    int? age,
    Links? links,
  }) =>
      DoctorDataModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalId: nationalId ?? this.nationalId,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        bloodType: bloodType ?? this.bloodType,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        image: image ?? this.image,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        salary: salary ?? this.salary,
        department: department ?? this.department,
        isAdmin: isAdmin ?? this.isAdmin,
        shifts: shifts ?? this.shifts,
        role: role ?? this.role,
        available: available ?? this.available,
        description: description ?? this.description,
        maxPatientNumber: maxPatientNumber ?? this.maxPatientNumber,
        appointmentPrice: appointmentPrice ?? this.appointmentPrice,
        staffType: staffType ?? this.staffType,
        fullName: fullName ?? this.fullName,
        age: age ?? this.age,
        links: links ?? this.links,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['national_id'] = nationalId;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['gender'] = gender;
    map['birth_date'] = birthDate;
    map['blood_type'] = bloodType;
    map['marital_status'] = maritalStatus;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['salary'] = salary;
    if (department != null) {
      map['department'] = department?.toJson();
    }
    map['is_admin'] = isAdmin;
    if (shifts != null) {
      map['shifts'] = shifts?.map((v) => v.toJson()).toList();
    }
    map['role'] = role;
    map['available'] = available;
    map['description'] = description;
    map['max_patient_number'] = maxPatientNumber;
    map['appointment_price'] = appointmentPrice;
    map['staff_type'] = staffType;
    map['full_name'] = fullName;
    map['age'] = age;
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }
}

class Links {
  Links({
    this.self,
    this.doctors,
    this.appointments,
    this.availabledates,
    this.totalincome,
    this.upcomingappointments,
  });

  Links.fromJson(dynamic json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    doctors =
        json['doctors'] != null ? Doctors.fromJson(json['doctors']) : null;
    appointments = json['appointments'] != null
        ? Appointments.fromJson(json['appointments'])
        : null;
    availabledates = json['available-dates'] != null
        ? AvailableDates.fromJson(json['available-dates'])
        : null;
    totalincome = json['total-income'] != null
        ? TotalIncome.fromJson(json['total-income'])
        : null;
    upcomingappointments = json['upcoming-appointments'] != null
        ? UpcomingAppointments.fromJson(json['upcoming-appointments'])
        : null;
  }

  Self? self;
  Doctors? doctors;
  Appointments? appointments;
  AvailableDates? availabledates;
  TotalIncome? totalincome;
  UpcomingAppointments? upcomingappointments;

  Links copyWith({
    Self? self,
    Doctors? doctors,
    Appointments? appointments,
    AvailableDates? availabledates,
    TotalIncome? totalincome,
    UpcomingAppointments? upcomingappointments,
  }) =>
      Links(
        self: self ?? this.self,
        doctors: doctors ?? this.doctors,
        appointments: appointments ?? this.appointments,
        availabledates: availabledates ?? this.availabledates,
        totalincome: totalincome ?? this.totalincome,
        upcomingappointments: upcomingappointments ?? this.upcomingappointments,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.toJson();
    }
    if (doctors != null) {
      map['doctors'] = doctors?.toJson();
    }
    if (appointments != null) {
      map['appointments'] = appointments?.toJson();
    }
    if (availabledates != null) {
      map['available-dates'] = availabledates?.toJson();
    }
    if (totalincome != null) {
      map['total-income'] = totalincome?.toJson();
    }
    if (upcomingappointments != null) {
      map['upcoming-appointments'] = upcomingappointments?.toJson();
    }
    return map;
  }
}

class UpcomingAppointments {
  UpcomingAppointments({
    this.href,
  });

  UpcomingAppointments.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  UpcomingAppointments copyWith({
    String? href,
  }) =>
      UpcomingAppointments(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class TotalIncome {
  TotalIncome({
    this.href,
  });

  TotalIncome.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  TotalIncome copyWith({
    String? href,
  }) =>
      TotalIncome(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class AvailableDates {
  AvailableDates({
    this.href,
  });

  AvailableDates.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  AvailableDates copyWith({
    String? href,
  }) =>
      AvailableDates(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class Appointments {
  Appointments({
    this.href,
  });

  Appointments.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  Appointments copyWith({
    String? href,
  }) =>
      Appointments(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class Doctors {
  Doctors({
    this.href,
  });

  Doctors.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  Doctors copyWith({
    String? href,
  }) =>
      Doctors(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class Self {
  Self({
    this.href,
  });

  Self.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  Self copyWith({
    String? href,
  }) =>
      Self(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class Shifts {
  Shifts({
    this.id,
    this.fromTime,
    this.toTime,
    this.day,
  });

  Shifts.fromJson(dynamic json) {
    id = json['id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    day = json['day'];
  }

  int? id;
  String? fromTime;
  String? toTime;
  String? day;

  Shifts copyWith({
    int? id,
    String? fromTime,
    String? toTime,
    String? day,
  }) =>
      Shifts(
        id: id ?? this.id,
        fromTime: fromTime ?? this.fromTime,
        toTime: toTime ?? this.toTime,
        day: day ?? this.day,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['from_time'] = fromTime;
    map['to_time'] = toTime;
    map['day'] = day;
    return map;
  }
}

class Department {
  Department({
    this.id,
    this.name,
    this.image,
    this.description,
    this.location,
    this.clinic,
  });

  Department.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    description = json['description'];
    location = json['location'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
  }

  int? id;
  String? name;
  Image? image;
  String? description;
  String? location;
  Clinic? clinic;

  Department copyWith({
    int? id,
    String? name,
    Image? image,
    String? description,
    String? location,
    Clinic? clinic,
  }) =>
      Department(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        location: location ?? this.location,
        clinic: clinic ?? this.clinic,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['description'] = description;
    map['location'] = location;
    if (clinic != null) {
      map['clinic'] = clinic?.toJson();
    }
    return map;
  }
}

class Clinic {
  Clinic({
    this.id,
    this.name,
    this.code,
    this.location,
    this.startDay,
    this.endDay,
    this.workDays,
  });

  Clinic.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    location = json['location'];
    startDay = json['start_day'];
    endDay = json['end_day'];
    workDays = json['work_days'];
  }

  int? id;
  String? name;
  String? code;
  String? location;
  String? startDay;
  String? endDay;
  int? workDays;

  Clinic copyWith({
    int? id,
    String? name,
    String? code,
    String? location,
    String? startDay,
    String? endDay,
    int? workDays,
  }) =>
      Clinic(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        location: location ?? this.location,
        startDay: startDay ?? this.startDay,
        endDay: endDay ?? this.endDay,
        workDays: workDays ?? this.workDays,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['location'] = location;
    map['start_day'] = startDay;
    map['end_day'] = endDay;
    map['work_days'] = workDays;
    return map;
  }
}

class Image {
  Image({
    this.fileName,
    this.fileUrl,
  });

  Image.fromJson(dynamic json) {
    fileName = json['file_name'];
    fileUrl = json['file_url'];
  }

  String? fileName;
  String? fileUrl;

  Image copyWith({
    String? fileName,
    String? fileUrl,
  }) =>
      Image(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_name'] = fileName;
    map['file_url'] = fileUrl;
    return map;
  }
}
