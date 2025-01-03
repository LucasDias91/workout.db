use Workout;

create table SQLCache(
ID nvarchar(449) not null,
Value blob not null,
ExpiresAtTime TIMESTAMP not null,
SlidingExpirationInSeconds bigint,
AbsoluteExpiration TIMESTAMP null,
CONSTRAINT PK_SQLCache PRIMARY KEY (ID)
)