"""First migration

Revision ID: 6469fe1eeb9f
Revises: 
Create Date: 2023-07-23 11:08:51.919559

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6469fe1eeb9f'
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('scene',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('scene_id', sa.Integer(), nullable=True),
    sa.Column('name', sa.String(length=100), nullable=True),
    sa.Column('path_img', sa.String(length=100), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('scene_id')
    )
    op.create_table('window',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('window_id', sa.Integer(), nullable=True),
    sa.Column('scene_id', sa.Integer(), nullable=True),
    sa.Column('text', sa.String(length=100), nullable=True),
    sa.Column('character', sa.String(length=100), nullable=True),
    sa.Column('path_img', sa.String(length=100), nullable=True),
    sa.Column('position', sa.String(length=100), nullable=True),
    sa.ForeignKeyConstraint(['scene_id'], ['scene.scene_id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('window')
    op.drop_table('scene')
    # ### end Alembic commands ###