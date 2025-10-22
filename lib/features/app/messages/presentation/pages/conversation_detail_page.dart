import 'package:cinmash/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/message.dart';

class ConversationDetailPage extends StatefulWidget {
  final Conversation conversation;

  const ConversationDetailPage({super.key, required this.conversation});

  @override
  State<ConversationDetailPage> createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];
  bool _isTyping = false;
  bool _isRecording = false;
  Message? _replyingTo;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    setState(() {
      _messages.addAll([
        Message(
          id: '1',
          senderId: '1', // cyntia
          senderName: 'cyntia',
          senderAvatar:
              widget.conversation.avatarUrl ??
              'https://randomuser.me/api/portraits/women/1.jpg',
          content: 'Salut ! Comment ça va ?',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
          isRead: true,
          status: MessageStatus.read,
        ),
        Message(
          id: '2',
          senderId: '2', // You
          senderName: 'You',
          senderAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
          content: 'Ça va bien, merci ! Et toi ?',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
          isRead: true,
          status: MessageStatus.read,
        ),
        Message(
          id: '3',
          senderId: '1', // cyntia
          senderName: 'cyntia',
          senderAvatar:
              widget.conversation.avatarUrl ??
              'https://randomuser.me/api/portraits/women/1.jpg',
          content: 'Très bien ! Tu fais quoi ce weekend ?',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
          isRead: true,
          status: MessageStatus.read,
        ),
        Message(
          id: '4',
          senderId: '2', // You
          senderName: 'You',
          senderAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
          content: 'Je vais au cinéma avec des amis',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
          isRead: true,
          status: MessageStatus.delivered,
        ),
        Message(
          id: '5',
          senderId: '1', // cyntia
          senderName: 'cyntia',
          senderAvatar:
              widget.conversation.avatarUrl ??
              'https://randomuser.me/api/portraits/women/1.jpg',
          content: 'Cool ! Quel film ?',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          isRead: false,
          status: MessageStatus.sent,
        ),
        Message(
          id: '6',
          senderId: '2', // You
          senderName: 'You',
          senderAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
          content: 'Le nouveau Marvel',
          type: MessageType.text,
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          isRead: false,
          status: MessageStatus.sent,
        ),
        Message(
          id: '7',
          senderId: '1', // cyntia
          senderName: 'cyntia',
          senderAvatar:
              widget.conversation.avatarUrl ??
              'https://randomuser.me/api/portraits/women/1.jpg',
          content: 'Voice message (0:04)',
          type: MessageType.audio,
          timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
          isRead: true,
          status: MessageStatus.read,
          audioDuration: const Duration(seconds: 4),
        ),
      ]);
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: '2', // You
      senderName: 'You',
      senderAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      content: _messageController.text.trim(),
      type: MessageType.text,
      timestamp: DateTime.now(),
      isRead: false,
      status: MessageStatus.sent,
      replyTo: _replyingTo,
    );

    setState(() {
      _messages.add(newMessage);
      _messageController.clear();
      _isTyping = false;
      _replyingTo = null;
    });

    // Simuler la livraison et lecture
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          // Créer un nouveau message avec le statut mis à jour
          final index = _messages.indexWhere((m) => m.id == newMessage.id);
          if (index != -1) {
            _messages[index] = Message(
              id: newMessage.id,
              senderId: newMessage.senderId,
              senderName: newMessage.senderName,
              senderAvatar: newMessage.senderAvatar,
              content: newMessage.content,
              type: newMessage.type,
              timestamp: newMessage.timestamp,
              isRead: newMessage.isRead,
              status: MessageStatus.delivered,
              replyTo: newMessage.replyTo,
            );
          }
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          // Créer un nouveau message avec le statut mis à jour
          final index = _messages.indexWhere((m) => m.id == newMessage.id);
          if (index != -1) {
            _messages[index] = Message(
              id: newMessage.id,
              senderId: newMessage.senderId,
              senderName: newMessage.senderName,
              senderAvatar: newMessage.senderAvatar,
              content: newMessage.content,
              type: newMessage.type,
              timestamp: newMessage.timestamp,
              isRead: newMessage.isRead,
              status: MessageStatus.read,
              replyTo: newMessage.replyTo,
            );
          }
        });
      }
    });
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
    });
    // TODO: Implémenter l'enregistrement vocal
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    // TODO: Arrêter l'enregistrement et envoyer
  }

  void _cancelReply() {
    setState(() {
      _replyingTo = null;
    });
  }

  void _replyToMessage(Message message) {
    setState(() {
      _replyingTo = message;
    });
  }

  String _getTimeString(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${timestamp.day}/${timestamp.month}';
    } else if (difference.inHours > 0) {
      return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else if (difference.inMinutes > 0) {
      return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
    } else {
      return 'À l\'instant';
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _showConversationOptions(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF192734) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.search,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Rechercher',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Implémenter la recherche
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_off,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Muet',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Mettre en sourdine
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.block,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Bloquer',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Bloquer l'utilisateur
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text(
                    'Supprimer la conversation',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Supprimer la conversation
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _showAttachmentOptions(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF192734) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Photo',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Sélectionner une photo
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.videocam,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Vidéo',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Sélectionner une vidéo
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.insert_drive_file,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Document',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Sélectionner un document
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 8,
              16,
              12,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondDarkColor,
            ),
            child: Row(
              children: [
                // Bouton retour
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),

                // Avatar du contact
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      widget.conversation.avatarUrl != null
                          ? NetworkImage(widget.conversation.avatarUrl!)
                          : null,
                  backgroundColor:
                      widget.conversation.avatarUrl == null
                          ? const Color(0xFF1DA1F2)
                          : null,
                  child:
                      widget.conversation.avatarUrl == null
                          ? Text(
                            widget.conversation.name[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : null,
                ),
                const SizedBox(width: 12),

                // Nom et statut du contact
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.conversation.name,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.conversation.isOnline)
                        Text(
                          'En ligne',
                          style: TextStyle(
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),

                // Actions
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    _showConversationOptions(context, isDark);
                  },
                ),
              ],
            ),
          ),

          if (_replyingTo != null) _buildReplyPreview(isDark),

          // Messages avec arrière-plan subtil
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkColor,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  return _buildMessageBubble(message, isDark);
                },
              ),
            ),
          ),

          // Barre de saisie améliorée
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReplyPreview(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF192734) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1DA1F2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Répondre à ${_replyingTo!.senderName}',
                  style: TextStyle(
                    color: const Color(0xFF1DA1F2),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _replyingTo!.content,
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              size: 20,
            ),
            onPressed: _cancelReply,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message, bool isDark) {
    final isMe =
        message.senderId == '2' || message.senderId == '3'; // You ou Ekier

    return Dismissible(
      key: Key(message.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1DA1F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(Icons.reply, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              'Répondre',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        _replyToMessage(message);
        return false; // Don't actually dismiss the widget
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe) ...[
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(message.senderAvatar),
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      isMe
                          ? const Color(
                            0xFF1DA1F2,
                          ) // Bleu de l'app pour mes messages
                          : (isDark
                              ? const Color(0xFF192734)
                              : Colors.white), // Fond adaptatif
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message de réponse
                    if (message.replyTo != null)
                      _buildReplyMessage(message.replyTo!, isDark, isMe),
                    if (message.replyTo != null) const SizedBox(height: 8),
                    // Contenu du message
                    _buildMessageContent(message, isDark, isMe),
                  ],
                ),
              ),
            ),
            if (isMe) ...[
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [_buildMessageStatus(message.status)],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getTimeString(message.timestamp),
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    _getTimeString(message.timestamp),
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildReplyMessage(Message replyTo, bool isDark, bool isMe) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            isMe
                ? Colors.white.withOpacity(0.2)
                : (isDark ? Colors.grey[800] : Colors.grey[100]),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: const Color(0xFF1DA1F2), width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            replyTo.senderName,
            style: TextStyle(
              color: const Color(0xFF1DA1F2),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            replyTo.content,
            style: TextStyle(
              color:
                  isMe
                      ? Colors.white70
                      : (isDark ? Colors.grey[400] : Colors.grey[600]),
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageStatus(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return const Icon(Icons.done, size: 16, color: Colors.white70);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 16, color: Colors.white70);
      case MessageStatus.read:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Color(0xFF34B7F1), // Bleu pour lu
        );
    }
  }

  Widget _buildMessageContent(Message message, bool isDark, bool isMe) {
    return Text(
      message.content,
      style: TextStyle(
        color:
        isMe ? Colors.white : (isDark ? Colors.white : Colors.black87),
        fontSize: 16,
        height: 1.4,
      ),
    );
  }


  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondDarkColor,
        border: Border(
          top: BorderSide(
            color: AppColors.darkColor,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.darkColor,
                  width: 1.2.sp,
                ),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Tapez un message...',
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontFamily: "poppins"
                  ),
                  fillColor: AppColors.darkColor,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                maxLines: null,
                style: TextStyle(
                  color: AppColors.lightColor,
                  fontSize: 16,
                ),
                onChanged: (value) {
                  setState(() {
                    _isTyping = value.isNotEmpty;
                  });
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    _sendMessage();
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
