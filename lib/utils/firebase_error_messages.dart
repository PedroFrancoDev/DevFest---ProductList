import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseErrorMessages {
  static String fromException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return "Você não tem permissão para realizar esta ação.";

      case 'not-found':
        return "O item solicitado não foi encontrado.";

      case 'already-exists':
        return "Este registro já existe no sistema.";

      case 'unavailable':
        return "Serviço indisponível no momento. Verifique sua conexão.";

      case 'aborted':
        return "A operação foi interrompida. Tente novamente.";

      case 'deadline-exceeded':
        return "A operação demorou muito para responder.";

      case 'invalid-argument':
        return "Algumas informações enviadas são inválidas.";

      case 'failed-precondition':
        return "Não foi possível realizar esta ação agora.";

      case 'resource-exhausted':
        return "Limite de uso atingido. Tente novamente mais tarde.";

      // ===== Firebase Auth =====
      case 'wrong-password':
        return "A senha que inseriu está incorreta.";

      case 'user-not-found':
        return "Nenhuma conta corresponde a este email.";

      case 'email-already-in-use':
        return "Este email já está associado a outra conta.";

      case 'invalid-email':
        return "O email informado é inválido.";

      case 'weak-password':
        return "A senha é muito fraca. Escolha uma senha mais forte.";

      case 'user-disabled':
        return "Esta conta foi desativada.";

      case 'too-many-requests':
        return "Muitas tentativas inválidas. Tente novamente mais tarde.";

      case 'operation-not-allowed':
        return "Este tipo de login não está permitido.";

      case 'network-request-failed':
        return "Falha de conexão. Verifique sua internet.";

      // ===== Genéricos =====
      case 'unauthenticated':
        return "Sua sessão expirou. Entre novamente.";

      default:
        return "Ocorreu um erro inesperado. Tente novamente.";
    }
  }
}
