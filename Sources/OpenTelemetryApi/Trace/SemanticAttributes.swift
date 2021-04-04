// Copyright 2020, OpenTelemetry Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// DO **NOT** EDIT. This file is automatically generated.

import Foundation

public enum SemanticAttributes: String {
    /**
    An identifier for the database management system (DBMS) product being used. See below for a list of well-known identifiers.

    - Requires: Value type should be `String`
    */
    case dbSystem = "db.system"
    /**
    The connection string used to connect to the database. It is recommended to remove embedded credentials.

    ~~~
    // Examples
    attributes[.dbConnectionString] = "Server=(localdb)\v11.0;Integrated Security=true;"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbConnectionString = "db.connection_string"
    /**
    Username for accessing the database.

    ~~~
    // Examples
    attributes[.dbUser] = "readonly_user"
    attributes[.dbUser] = "reporting_user"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbUser = "db.user"
    /**
    The fully-qualified class name of the [Java Database Connectivity (JDBC)](https://docs.oracle.com/javase/8/docs/technotes/guides/jdbc/) driver used to connect.

    ~~~
    // Examples
    attributes[.dbJdbcDriverClassname] = "org.postgresql.Driver"
    attributes[.dbJdbcDriverClassname] = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbJdbcDriverClassname = "db.jdbc.driver_classname"
    /**
    If no [tech-specific attribute](#call-level-attributes-for-specific-technologies) is defined, this attribute is used to report the name of the database being accessed. For commands that switch the database, this should be set to the target database (even if the command fails).

    ~~~
    // Examples
    attributes[.dbName] = "customers"
    attributes[.dbName] = "main"
    ~~~

    - Note: In some SQL databases, the database name to be used is called "schema name".

    - Requires: Value type should be `String`
    */
    case dbName = "db.name"
    /**
    The database statement being executed.

    ~~~
    // Examples
    attributes[.dbStatement] = "SELECT * FROM wuser_table"
    attributes[.dbStatement] = "SET mykey \"WuValue\""
    ~~~

    - Note: The value may be sanitized to exclude sensitive information.

    - Requires: Value type should be `String`
    */
    case dbStatement = "db.statement"
    /**
    The name of the operation being executed, e.g. the [MongoDB command name](https://docs.mongodb.com/manual/reference/command/#database-operations) such as `findAndModify`, or the SQL keyword.

    ~~~
    // Examples
    attributes[.dbOperation] = "findAndModify"
    attributes[.dbOperation] = "HMSET"
    attributes[.dbOperation] = "SELECT"
    ~~~

    - Note: When setting this to an SQL keyword, it is not recommended to attempt any client-side parsing of `db.statement` just to get this property, but it should be set if the operation name is provided by the library being instrumented. If the SQL statement has an ambiguous operation, or performs more than one operation, this value may be omitted.

    - Requires: Value type should be `String`
    */
    case dbOperation = "db.operation"
    /**
    Remote hostname or similar, see note below.

    ~~~
    // Examples
    attributes[.netPeerName] = "example.com"
    ~~~

    - Requires: Value type should be `String`
    */
    case netPeerName = "net.peer.name"
    /**
    Remote address of the peer (dotted decimal for IPv4 or [RFC5952](https://tools.ietf.org/html/rfc5952) for IPv6).

    ~~~
    // Examples
    attributes[.netPeerIp] = "127.0.0.1"
    ~~~

    - Requires: Value type should be `String`
    */
    case netPeerIp = "net.peer.ip"
    /**
    Remote port number.

    ~~~
    // Examplesattributes[.netPeerPort] = 80attributes[.netPeerPort] = 8080attributes[.netPeerPort] = 443
    ~~~

    - Requires: Value type should be `Int`
    */
    case netPeerPort = "net.peer.port"
    /**
    Transport protocol used. See note below.

    ~~~
    // Examples
    attributes[.netTransport] = "IP.TCP"
    ~~~

    - Requires: Value type should be `String`
    */
    case netTransport = "net.transport"
    /**
    The Microsoft SQL Server [instance name](https://docs.microsoft.com/en-us/sql/connect/jdbc/building-the-connection-url?view=sql-server-ver15) connecting to. This name is used to determine the port of a named instance.

    ~~~
    // Examples
    attributes[.dbMssqlInstanceName] = "MSSQLSERVER"
    ~~~

    - Note: If setting a `db.mssql.instance_name`, `net.peer.port` is no longer required (but still recommended if non-standard).

    - Requires: Value type should be `String`
    */
    case dbMssqlInstanceName = "db.mssql.instance_name"
    /**
    The name of the keyspace being accessed. To be used instead of the generic `db.name` attribute.

    ~~~
    // Examples
    attributes[.dbCassandraKeyspace] = "mykeyspace"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbCassandraKeyspace = "db.cassandra.keyspace"
    /**
    The fetch size used for paging, i.e. how many rows will be returned at once.

    ~~~
    // Examplesattributes[.dbCassandraPageSize] = 5000
    ~~~

    - Requires: Value type should be `Int`
    */
    case dbCassandraPageSize = "db.cassandra.page_size"
    /**
    The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).

    - Requires: Value type should be `String`
    */
    case dbCassandraConsistencyLevel = "db.cassandra.consistency_level"
    /**
    The name of the primary table that the operation is acting upon, including the schema name (if applicable).

    ~~~
    // Examples
    attributes[.dbCassandraTable] = "mytable"
    ~~~

    - Note: This mirrors the db.sql.table attribute but references cassandra rather than sql. It is not recommended to attempt any client-side parsing of `db.statement` just to get this property, but it should be set if it is provided by the library being instrumented. If the operation is acting upon an anonymous table, or more than one table, this value MUST NOT be set.

    - Requires: Value type should be `String`
    */
    case dbCassandraTable = "db.cassandra.table"
    /**
    Whether or not the query is idempotent.

    - Requires: Value type should be `Bool`
    */
    case dbCassandraIdempotence = "db.cassandra.idempotence"
    /**
    The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.

    ~~~
    // Examplesattributes[.dbCassandraSpeculativeExecutionCount] = 0attributes[.dbCassandraSpeculativeExecutionCount] = 2
    ~~~

    - Requires: Value type should be `Int`
    */
    case dbCassandraSpeculativeExecutionCount = "db.cassandra.speculative_execution_count"
    /**
    The ID of the coordinating node for a query.

    ~~~
    // Examples
    attributes[.dbCassandraCoordinatorId] = "be13faa2-8574-4d71-926d-27f16cf8a7af"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbCassandraCoordinatorId = "db.cassandra.coordinator.id"
    /**
    The data center of the coordinating node for a query.

    ~~~
    // Examples
    attributes[.dbCassandraCoordinatorDc] = "us-west-2"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbCassandraCoordinatorDc = "db.cassandra.coordinator.dc"
    /**
    The [HBase namespace](https://hbase.apache.org/book.html#_namespace) being accessed. To be used instead of the generic `db.name` attribute.

    ~~~
    // Examples
    attributes[.dbHbaseNamespace] = "default"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbHbaseNamespace = "db.hbase.namespace"
    /**
    The index of the database being accessed as used in the [`SELECT` command](https://redis.io/commands/select), provided as an integer. To be used instead of the generic `db.name` attribute.

    ~~~
    // Examplesattributes[.dbRedisDatabaseIndex] = 0attributes[.dbRedisDatabaseIndex] = 1attributes[.dbRedisDatabaseIndex] = 15
    ~~~

    - Requires: Value type should be `Int`
    */
    case dbRedisDatabaseIndex = "db.redis.database_index"
    /**
    The collection being accessed within the database stated in `db.name`.

    ~~~
    // Examples
    attributes[.dbMongodbCollection] = "customers"
    attributes[.dbMongodbCollection] = "products"
    ~~~

    - Requires: Value type should be `String`
    */
    case dbMongodbCollection = "db.mongodb.collection"
    /**
    The name of the primary table that the operation is acting upon, including the schema name (if applicable).

    ~~~
    // Examples
    attributes[.dbSqlTable] = "public.users"
    attributes[.dbSqlTable] = "customers"
    ~~~

    - Note: It is not recommended to attempt any client-side parsing of `db.statement` just to get this property, but it should be set if it is provided by the library being instrumented. If the operation is acting upon an anonymous table, or more than one table, this value MUST NOT be set.

    - Requires: Value type should be `String`
    */
    case dbSqlTable = "db.sql.table"
    /**
    The type of the exception (its fully-qualified class name, if applicable). The dynamic type of the exception should be preferred over the static type in languages that support it.

    ~~~
    // Examples
    attributes[.exceptionType] = "java.net.ConnectException"
    attributes[.exceptionType] = "OSError"
    ~~~

    - Requires: Value type should be `String`
    */
    case exceptionType = "exception.type"
    /**
    The exception message.

    ~~~
    // Examples
    attributes[.exceptionMessage] = "Division by zero"
    attributes[.exceptionMessage] = "Can't convert 'int' object to str implicitly"
    ~~~

    - Requires: Value type should be `String`
    */
    case exceptionMessage = "exception.message"
    /**
    A stacktrace as a string in the natural representation for the language runtime. The representation is to be determined and documented by each language SIG.

    ~~~
    // Examples
    attributes[.exceptionStacktrace] = "Exception in thread \"main\" java.lang.RuntimeException: Test exception\n at com.example.GenerateTrace.methodB(GenerateTrace.java:13)\n at com.example.GenerateTrace.methodA(GenerateTrace.java:9)\n at com.example.GenerateTrace.main(GenerateTrace.java:5)"
    ~~~

    - Requires: Value type should be `String`
    */
    case exceptionStacktrace = "exception.stacktrace"
    /**
    SHOULD be set to true if the exception event is recorded at a point where it is known that the exception is escaping the scope of the span.

    - Note: An exception is considered to have escaped (or left) the scope of a span,
      if that span is ended while the exception is still logically "in flight".
      This may be actually "in flight" in some languages (e.g. if the exception
      is passed to a Context manager's `__exit__` method in Python) but will
      usually be caught at the point of recording the exception in most languages.

      It is usually not possible to determine at the point where an exception is thrown
      whether it will escape the scope of a span.
      However, it is trivial to know that an exception
      will escape, if one checks for an active exception just before ending the span,
      as done in the [example above](#exception-end-example).

      It follows that an exception may still escape the scope of the span
      even if the `exception.escaped` attribute was not set or set to false,
      since the event might have been recorded at a time where it was not
      clear whether the exception will escape.

    - Requires: Value type should be `Bool`
    */
    case exceptionEscaped = "exception.escaped"
    /**
    Type of the trigger on which the function is executed.

    - Requires: Value type should be `String`
    */
    case faasTrigger = "faas.trigger"
    /**
    The execution ID of the current function execution.

    ~~~
    // Examples
    attributes[.faasExecution] = "af9d5aa4-a685-4c5f-a22b-444f80b3cc28"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasExecution = "faas.execution"
    /**
    The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.

    ~~~
    // Examples
    attributes[.faasDocumentCollection] = "myBucketName"
    attributes[.faasDocumentCollection] = "myDbName"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasDocumentCollection = "faas.document.collection"
    /**
    Describes the type of the operation that was performed on the data.

    - Requires: Value type should be `String`
    */
    case faasDocumentOperation = "faas.document.operation"
    /**
    A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

    ~~~
    // Examples
    attributes[.faasDocumentTime] = "2020-01-23T13:47:06Z"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasDocumentTime = "faas.document.time"
    /**
    The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.

    ~~~
    // Examples
    attributes[.faasDocumentName] = "myFile.txt"
    attributes[.faasDocumentName] = "myTableName"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasDocumentName = "faas.document.name"
    /**
    HTTP request method.

    ~~~
    // Examples
    attributes[.httpMethod] = "GET"
    attributes[.httpMethod] = "POST"
    attributes[.httpMethod] = "HEAD"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpMethod = "http.method"
    /**
    Full HTTP request URL in the form `scheme://host[:port]/path?query[#fragment]`. Usually the fragment is not transmitted over HTTP, but if it is known, it should be included nevertheless.

    ~~~
    // Examples
    attributes[.httpUrl] = "https://www.foo.bar/search?q=OpenTelemetry#SemConv"
    ~~~

    - Note: `http.url` MUST NOT contain credentials passed via URL in form of `https://username:password@www.example.com/`. In such case the attribute's value should be `https://www.example.com/`.

    - Requires: Value type should be `String`
    */
    case httpUrl = "http.url"
    /**
    The full request target as passed in a HTTP request line or equivalent.

    ~~~
    // Examples
    attributes[.httpTarget] = "/path/12314/?q=ddds#123"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpTarget = "http.target"
    /**
    The value of the [HTTP host header](https://tools.ietf.org/html/rfc7230#section-5.4). When the header is empty or not present, this attribute should be the same.

    ~~~
    // Examples
    attributes[.httpHost] = "www.example.org"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpHost = "http.host"
    /**
    The URI scheme identifying the used protocol.

    ~~~
    // Examples
    attributes[.httpScheme] = "http"
    attributes[.httpScheme] = "https"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpScheme = "http.scheme"
    /**
    [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).

    ~~~
    // Examplesattributes[.httpStatusCode] = 200
    ~~~

    - Requires: Value type should be `Int`
    */
    case httpStatusCode = "http.status_code"
    /**
    Kind of HTTP protocol used.

    ~~~
    // Examples
    attributes[.httpFlavor] = "1.0"
    ~~~

    - Note: If `net.transport` is not specified, it can be assumed to be `IP.TCP` except if `http.flavor` is `QUIC`, in which case `IP.UDP` is assumed.

    - Requires: Value type should be `String`
    */
    case httpFlavor = "http.flavor"
    /**
    Value of the [HTTP User-Agent](https://tools.ietf.org/html/rfc7231#section-5.5.3) header sent by the client.

    ~~~
    // Examples
    attributes[.httpUserAgent] = "CERN-LineMode/2.15 libwww/2.17b3"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpUserAgent = "http.user_agent"
    /**
    The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://tools.ietf.org/html/rfc7230#section-3.3.2) header. For requests using transport encoding, this should be the compressed size.

    ~~~
    // Examplesattributes[.httpRequestContentLength] = 3495
    ~~~

    - Requires: Value type should be `Int`
    */
    case httpRequestContentLength = "http.request_content_length"
    /**
    The size of the uncompressed request payload body after transport decoding. Not set if transport encoding not used.

    ~~~
    // Examplesattributes[.httpRequestContentLengthUncompressed] = 5493
    ~~~

    - Requires: Value type should be `Int`
    */
    case httpRequestContentLengthUncompressed = "http.request_content_length_uncompressed"
    /**
    The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://tools.ietf.org/html/rfc7230#section-3.3.2) header. For requests using transport encoding, this should be the compressed size.

    ~~~
    // Examplesattributes[.httpResponseContentLength] = 3495
    ~~~

    - Requires: Value type should be `Int`
    */
    case httpResponseContentLength = "http.response_content_length"
    /**
    The size of the uncompressed response payload body after transport decoding. Not set if transport encoding not used.

    ~~~
    // Examplesattributes[.httpResponseContentLengthUncompressed] = 5493
    ~~~

    - Requires: Value type should be `Int`
    */
    case httpResponseContentLengthUncompressed = "http.response_content_length_uncompressed"
    /**
    The primary server name of the matched virtual host. This should be obtained via configuration. If no such configuration can be obtained, this attribute MUST NOT be set ( `net.host.name` should be used instead).

    ~~~
    // Examples
    attributes[.httpServerName] = "example.com"
    ~~~

    - Note: `http.url` is usually not readily available on the server side but would have to be assembled in a cumbersome and sometimes lossy process from other information (see e.g. open-telemetry/opentelemetry-python/pull/148). It is thus preferred to supply the raw data that is available.

    - Requires: Value type should be `String`
    */
    case httpServerName = "http.server_name"
    /**
    The matched route (path template).

    ~~~
    // Examples
    attributes[.httpRoute] = "/users/:userID?"
    ~~~

    - Requires: Value type should be `String`
    */
    case httpRoute = "http.route"
    /**
    The IP address of the original client behind all proxies, if known (e.g. from [X-Forwarded-For](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For)).

    ~~~
    // Examples
    attributes[.httpClientIp] = "83.164.160.102"
    ~~~

    - Note: This is not necessarily the same as `net.peer.ip`, which would identify the network-level peer, which may be a proxy.

    - Requires: Value type should be `String`
    */
    case httpClientIp = "http.client_ip"
    /**
    Like `net.peer.ip` but for the host IP. Useful in case of a multi-IP host.

    ~~~
    // Examples
    attributes[.netHostIp] = "192.168.0.1"
    ~~~

    - Requires: Value type should be `String`
    */
    case netHostIp = "net.host.ip"
    /**
    Like `net.peer.port` but for the host port.

    ~~~
    // Examplesattributes[.netHostPort] = 35555
    ~~~

    - Requires: Value type should be `Int`
    */
    case netHostPort = "net.host.port"
    /**
    Local hostname or similar, see note below.

    ~~~
    // Examples
    attributes[.netHostName] = "localhost"
    ~~~

    - Requires: Value type should be `String`
    */
    case netHostName = "net.host.name"
    /**
    A string identifying the messaging system.

    ~~~
    // Examples
    attributes[.messagingSystem] = "kafka"
    attributes[.messagingSystem] = "rabbitmq"
    attributes[.messagingSystem] = "activemq"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingSystem = "messaging.system"
    /**
    The message destination name. This might be equal to the span name but is required nevertheless.

    ~~~
    // Examples
    attributes[.messagingDestination] = "MyQueue"
    attributes[.messagingDestination] = "MyTopic"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingDestination = "messaging.destination"
    /**
    The kind of message destination.

    - Requires: Value type should be `String`
    */
    case messagingDestinationKind = "messaging.destination_kind"
    /**
    A boolean that is true if the message destination is temporary.

    - Requires: Value type should be `Bool`
    */
    case messagingTempDestination = "messaging.temp_destination"
    /**
    The name of the transport protocol.

    ~~~
    // Examples
    attributes[.messagingProtocol] = "AMQP"
    attributes[.messagingProtocol] = "MQTT"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingProtocol = "messaging.protocol"
    /**
    The version of the transport protocol.

    ~~~
    // Examples
    attributes[.messagingProtocolVersion] = "0.9.1"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingProtocolVersion = "messaging.protocol_version"
    /**
    Connection string.

    ~~~
    // Examples
    attributes[.messagingUrl] = "tibjmsnaming://localhost:7222"
    attributes[.messagingUrl] = "https://queue.amazonaws.com/80398EXAMPLE/MyQueue"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingUrl = "messaging.url"
    /**
    A value used by the messaging system as an identifier for the message, represented as a string.

    ~~~
    // Examples
    attributes[.messagingMessageId] = "452a7c7c7c7048c2f887f61572b18fc2"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingMessageId = "messaging.message_id"
    /**
    The [conversation ID](#conversations) identifying the conversation to which the message belongs, represented as a string. Sometimes called "Correlation ID".

    ~~~
    // Examples
    attributes[.messagingConversationId] = "MyConversationId"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingConversationId = "messaging.conversation_id"
    /**
    The (uncompressed) size of the message payload in bytes. Also use this attribute if it is unknown whether the compressed or uncompressed payload size is reported.

    ~~~
    // Examplesattributes[.messagingMessagePayloadSizeBytes] = 2738
    ~~~

    - Requires: Value type should be `Int`
    */
    case messagingMessagePayloadSizeBytes = "messaging.message_payload_size_bytes"
    /**
    The compressed size of the message payload in bytes.

    ~~~
    // Examplesattributes[.messagingMessagePayloadCompressedSizeBytes] = 2048
    ~~~

    - Requires: Value type should be `Int`
    */
    case messagingMessagePayloadCompressedSizeBytes = "messaging.message_payload_compressed_size_bytes"
    /**
    A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

    ~~~
    // Examples
    attributes[.faasTime] = "2020-01-23T13:47:06Z"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasTime = "faas.time"
    /**
    A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).

    ~~~
    // Examples
    attributes[.faasCron] = "0/5 * * * ? *"
    ~~~

    - Requires: Value type should be `String`
    */
    case faasCron = "faas.cron"
    /**
    A boolean that is true if the serverless function is executed for the first time (aka cold-start).

    - Requires: Value type should be `Bool`
    */
    case faasColdstart = "faas.coldstart"
    /**
    The name of the invoked function.

    ~~~
    // Examples
    attributes[.faasInvokedName] = "my-function"
    ~~~

    - Note: SHOULD be equal to the `faas.name` resource attribute of the invoked function.

    - Requires: Value type should be `String`
    */
    case faasInvokedName = "faas.invoked_name"
    /**
    The cloud provider of the invoked function.

    ~~~
    // Examples
    attributes[.faasInvokedProvider] = "aws"
    ~~~

    - Note: SHOULD be equal to the `cloud.provider` resource attribute of the invoked function.

    - Requires: Value type should be `String`
    */
    case faasInvokedProvider = "faas.invoked_provider"
    /**
    The cloud region of the invoked function.

    ~~~
    // Examples
    attributes[.faasInvokedRegion] = "eu-central-1"
    ~~~

    - Note: SHOULD be equal to the `cloud.region` resource attribute of the invoked function.

    - Requires: Value type should be `String`
    */
    case faasInvokedRegion = "faas.invoked_region"
    /**
    The [`service.name`](../../resource/semantic_conventions/README.md#service) of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.

    ~~~
    // Examples
    attributes[.peerService] = "AuthTokenCache"
    ~~~

    - Requires: Value type should be `String`
    */
    case peerService = "peer.service"
    /**
    Username or client_id extracted from the access token or [Authorization](https://tools.ietf.org/html/rfc7235#section-4.2) header in the inbound request from outside the system.

    ~~~
    // Examples
    attributes[.enduserId] = "username"
    ~~~

    - Requires: Value type should be `String`
    */
    case enduserId = "enduser.id"
    /**
    Actual/assumed role the client is making the request under extracted from token or application security context.

    ~~~
    // Examples
    attributes[.enduserRole] = "admin"
    ~~~

    - Requires: Value type should be `String`
    */
    case enduserRole = "enduser.role"
    /**
    Scopes or granted authorities the client currently possesses extracted from token or application security context. The value would come from the scope associated with an [OAuth 2.0 Access Token](https://tools.ietf.org/html/rfc6749#section-3.3) or an attribute value in a [SAML 2.0 Assertion](http://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).

    ~~~
    // Examples
    attributes[.enduserScope] = "read:message, write:files"
    ~~~

    - Requires: Value type should be `String`
    */
    case enduserScope = "enduser.scope"
    /**
    Current "managed" thread ID (as opposed to OS thread ID).

    ~~~
    // Examplesattributes[.threadId] = 42
    ~~~

    - Requires: Value type should be `Int`
    */
    case threadId = "thread.id"
    /**
    Current thread name.

    ~~~
    // Examples
    attributes[.threadName] = "main"
    ~~~

    - Requires: Value type should be `String`
    */
    case threadName = "thread.name"
    /**
    The method or function name, or equivalent (usually rightmost part of the code unit's name).

    ~~~
    // Examples
    attributes[.codeFunction] = "serveRequest"
    ~~~

    - Requires: Value type should be `String`
    */
    case codeFunction = "code.function"
    /**
    The "namespace" within which `code.function` is defined. Usually the qualified class or module name, such that `code.namespace` + some separator + `code.function` form a unique identifier for the code unit.

    ~~~
    // Examples
    attributes[.codeNamespace] = "com.example.MyHttpService"
    ~~~

    - Requires: Value type should be `String`
    */
    case codeNamespace = "code.namespace"
    /**
    The source code file name that identifies the code unit as uniquely as possible (preferably an absolute file path).

    ~~~
    // Examples
    attributes[.codeFilepath] = "/usr/local/MyApplication/content_root/app/index.php"
    ~~~

    - Requires: Value type should be `String`
    */
    case codeFilepath = "code.filepath"
    /**
    The line number in `code.filepath` best representing the operation. It SHOULD point within the code unit named in `code.function`.

    ~~~
    // Examplesattributes[.codeLineno] = 42
    ~~~

    - Requires: Value type should be `Int`
    */
    case codeLineno = "code.lineno"
    /**
    A string identifying the kind of message consumption as defined in the [Operation names](#operation-names) section above. If the operation is "send", this attribute MUST NOT be set, since the operation can be inferred from the span kind in that case.

    - Requires: Value type should be `String`
    */
    case messagingOperation = "messaging.operation"
    /**
    Message keys in Kafka are used for grouping alike messages to ensure they're processed on the same partition. They differ from `messaging.message_id` in that they're not unique. If the key is `null`, the attribute MUST NOT be set.

    ~~~
    // Examples
    attributes[.messagingKafkaMessageKey] = "myKey"
    ~~~

    - Note: If the key type is not string, it's string representation has to be supplied for the attribute. If the key has no unambiguous, canonical string form, don't include its value.

    - Requires: Value type should be `String`
    */
    case messagingKafkaMessageKey = "messaging.kafka.message_key"
    /**
    Name of the Kafka Consumer Group that is handling the message. Only applies to consumers, not producers.

    ~~~
    // Examples
    attributes[.messagingKafkaConsumerGroup] = "my-group"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingKafkaConsumerGroup = "messaging.kafka.consumer_group"
    /**
    Client Id for the Consumer or Producer that is handling the message.

    ~~~
    // Examples
    attributes[.messagingKafkaClientId] = "client-5"
    ~~~

    - Requires: Value type should be `String`
    */
    case messagingKafkaClientId = "messaging.kafka.client_id"
    /**
    Partition the message is sent to.

    ~~~
    // Examplesattributes[.messagingKafkaPartition] = 2
    ~~~

    - Requires: Value type should be `Int`
    */
    case messagingKafkaPartition = "messaging.kafka.partition"
    /**
    A boolean that is true if the message is a tombstone.

    - Requires: Value type should be `Bool`
    */
    case messagingKafkaTombstone = "messaging.kafka.tombstone"
    /**
    A string identifying the remoting system.

    ~~~
    // Examples
    attributes[.rpcSystem] = "grpc"
    attributes[.rpcSystem] = "java_rmi"
    attributes[.rpcSystem] = "wcf"
    ~~~

    - Requires: Value type should be `String`
    */
    case rpcSystem = "rpc.system"
    /**
    The full name of the service being called, including its package name, if applicable.

    ~~~
    // Examples
    attributes[.rpcService] = "myservice.EchoService"
    ~~~

    - Requires: Value type should be `String`
    */
    case rpcService = "rpc.service"
    /**
    The name of the method being called, must be equal to the $method part in the span name.

    ~~~
    // Examples
    attributes[.rpcMethod] = "exampleMethod"
    ~~~

    - Requires: Value type should be `String`
    */
    case rpcMethod = "rpc.method"
    /**
    The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request.

    ~~~
    // Examplesattributes[.rpcGrpcStatusCode] = 0attributes[.rpcGrpcStatusCode] = 1attributes[.rpcGrpcStatusCode] = 16
    ~~~

    - Requires: Value type should be `Int`
    */
    case rpcGrpcStatusCode = "rpc.grpc.status_code"

    // MARK: - Manual Definitions
    // Some definitions have not yet been added to the YAML which generates this script.
    // As such as we have some manually defined cases.

    /**
    An exception event **MUST** be called "exception" as per the [specification](https://github.com/open-telemetry/opentelemetry-specification/blob/main/specification/trace/semantic_conventions/exceptions.md).
    */
    case exception = "exception";
    
}