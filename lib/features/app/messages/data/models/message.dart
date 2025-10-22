enum MessageType { text, image, file, audio, video, location }

enum MessageStatus { sent, delivered, read }

enum ConversationType { direct, group }

enum CallType { audio, video }

enum CallStatus { incoming, outgoing, missed, completed }

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String senderAvatar;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? imageUrl;
  final String? audioUrl;
  final String? videoUrl;
  final Duration? audioDuration;
  final Duration? videoDuration;
  final MessageStatus status;
  final Message? replyTo;

  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isRead,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
    this.audioDuration,
    this.videoDuration,
    this.status = MessageStatus.sent,
    this.replyTo,
  });
}

class Conversation {
  final String id;
  final String name;
  final String? avatarUrl;
  final ConversationType type;
  final List<String> participantIds;
  final List<String> participantNames;
  final Message? lastMessage;
  final DateTime lastActivity;
  final int unreadCount;
  final bool isOnline;
  final bool isPinned;
  final bool isMuted;
  final bool isBlocked;

  Conversation({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.type,
    required this.participantIds,
    required this.participantNames,
    this.lastMessage,
    required this.lastActivity,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isPinned = false,
    this.isMuted = false,
    this.isBlocked = false,
  });
}

class CallRecord {
  final String id;
  final String contactId;
  final String contactName;
  final String? contactAvatar;
  final CallType type;
  final CallStatus status;
  final DateTime timestamp;
  final Duration? duration;
  final bool isIncoming;

  CallRecord({
    required this.id,
    required this.contactId,
    required this.contactName,
    this.contactAvatar,
    required this.type,
    required this.status,
    required this.timestamp,
    this.duration,
    required this.isIncoming,
  });
}

class MessageSettings {
  final bool allowDirectMessages;
  final bool allowGroupMessages;
  final bool allowCalls;
  final bool allowVideoCalls;
  final List<String> allowedContacts;
  final List<String> blockedContacts;
  final bool readReceipts;
  final bool typingIndicators;
  final bool messageNotifications;
  final bool callNotifications;
  final String privacyLevel; // 'everyone', 'contacts', 'nobody'

  MessageSettings({
    this.allowDirectMessages = true,
    this.allowGroupMessages = true,
    this.allowCalls = true,
    this.allowVideoCalls = true,
    this.allowedContacts = const [],
    this.blockedContacts = const [],
    this.readReceipts = true,
    this.typingIndicators = true,
    this.messageNotifications = true,
    this.callNotifications = true,
    this.privacyLevel = 'contacts',
  });
}
