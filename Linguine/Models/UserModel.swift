import JWTDecode

struct User {
    let id: String
    let email: String
    let nickname: String
}

extension User {
    init?(from idToken: String) {
        guard let jwt = try? decode(jwt: idToken),
              let id = jwt.subject,
              let email = jwt["email"].string,
              let nickname = jwt["nickname"].string
        else {
            return nil
        }
        self.id = id
        self.email = email
        self.nickname = nickname
    }
}
